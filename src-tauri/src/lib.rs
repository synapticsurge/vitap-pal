// Learn more about Tauri commands at https://tauri.app/develop/calling-rust/
mod vtop;
use base64::{engine::general_purpose::URL_SAFE, Engine as _};
use tauri_plugin_http::reqwest;
use tokio::sync::Mutex;
use vtop::client::Iclient;
use vtop::parseattn;
use vtop::parsecoursepg;
use vtop::parsett;
use vtop::wifi;

// (true or false, "msg")
// msg:
// (true)
// SS = suceesfully
// LA = loginactive
// (false)
// NE = networkerror {may be device offline}
// VE = vtop error
//

async fn login_vtop(client: &mut Iclient) -> (bool, String) {
    let login_pg = client.login_pageload().await;
    let mut ans_cap = "".to_string();
    if login_pg.0 {
        let url_safe_encoded_data = URL_SAFE.encode(&client.captcha);
        match reqwest::get(format!(
            "http://cap.synapticsurge.in/cap/{}", //cap.synapticsurge.in
            url_safe_encoded_data
        ))
        .await
        {
            Ok(res) => ans_cap = res.text().await.expect("failed"),
            Err(_e) => return (false, "NE".to_string()),
        }
    }
    let p = client.login(ans_cap).await;
    p
}
#[tauri::command]
async fn onstart_runcode(
    state: tauri::State<'_, Mutex<Iclient>>,
    username: String,
    password: String,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    let m = client.loginactive;
    client.update_cred(username, password);
    let mut k = (m, "LA".to_string());
    if !m {
        k = login_vtop(&mut client).await;
    }
    Ok(k)
}
#[tauri::command]
async fn try_login(username: String, password: String) -> Result<(bool, String), tauri::Error> {
    let mut client = Iclient::new();
    let m = client.loginactive;
    client.update_cred(username, password);
    let mut k = (m, "".to_string());
    if !m {
        k = login_vtop(&mut client).await;
    }
    Ok(k)
}

#[tauri::command]
async fn update_credtials_to(
    state: tauri::State<'_, Mutex<Iclient>>,
    username: String,
    password: String,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    client.update_cred(username, password);
    Ok((true, "SS".to_string()))
}

#[tauri::command]
async fn timetable(
    state: tauri::State<'_, Mutex<Iclient>>,
    semid: String,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    let mut result = (false, "".to_string());
    let _ = client.check();
    let m = client.loginactive;
    if !m {
        let check = login_vtop(&mut client).await;
        result = check;
    }
    let m = client.loginactive;
    if m {
        let res = client.get_timetable(semid).await;
        if res.0 {
            let k = parsett::parse_timetable(res.1);
            if k == "[]" {
                result = (false, k);
            } else {
                result = (true, k)
            }
        } else {
            result = res;
        }
    }
    Ok(result)
}

#[tauri::command]
async fn timetable_semid(
    state: tauri::State<'_, Mutex<Iclient>>,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    let mut result = (false, "".to_string());
    let _ = client.check();
    let m = client.loginactive;
    if !m {
        let _check = login_vtop(&mut client).await;
        result = _check;
    }
    let m = client.loginactive;
    if m {
        let html = client.get_timetable_page().await;
        if html.0 {
            let k = parsett::parse_semid_timetable(html.1);
            if k == "[]" {
                result = (false, k);
            } else {
                result = (true, k)
            }
        } else {
            result = html;
        }
    }

    Ok(result)
}

#[tauri::command]
async fn attendance_semid(
    state: tauri::State<'_, Mutex<Iclient>>,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    let mut result = (false, "".to_string());
    let _ = client.check();
    let m = client.loginactive;
    if !m {
        let _check = login_vtop(&mut client).await;
        result = _check;
    }
    let m = client.loginactive;
    if m {
        let html = client.get_attendance_page().await;
        if html.0 {
            let k = parseattn::parse_semid_attendance(html.1);
            if k == "[]" {
                result = (false, k);
            } else {
                result = (true, k)
            }
        } else {
            result = html;
        }
    }

    Ok(result)
}

#[tauri::command]
async fn attendance(
    state: tauri::State<'_, Mutex<Iclient>>,
    semid: String,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    let mut result = (false, "".to_string());
    let _ = client.check();
    let m = client.loginactive;
    if !m {
        let _check = login_vtop(&mut client).await;
        result = _check;
    }
    let m = client.loginactive;
    if m {
        let html = client.get_attendance(semid).await;
        if html.0 {
            let k = parseattn::parse_attendance(html.1);
            if k == "[]" {
                result = (false, k);
            } else {
                result = (true, k)
            }
        } else {
            result = html;
        }
    }

    Ok(result)
}

#[tauri::command]
async fn full_attendance(
    state: tauri::State<'_, Mutex<Iclient>>,
    semid: String,
    course_id: String,
    course_type: String,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    let mut result = (false, "".to_string());
    let _ = client.check();
    let m = client.loginactive;
    if !m {
        let _check = login_vtop(&mut client).await;
        result = _check;
    }
    let m = client.loginactive;
    if m {
        let html = client
            .get_full_attendance(course_id, semid, course_type)
            .await;
        if html.0 {
            let k = parseattn::parse_full_attendance(html.1);
            if k == "[]" {
                result = (false, k);
            } else {
                result = (true, k)
            }
        } else {
            result = html;
        }
    }

    Ok(result)
}

#[tauri::command]
async fn wifi(i: i32, username: String, password: String) -> Result<(bool, String), tauri::Error> {
    let k = wifi::wifi_login_logout(i, username, password).await;
    Ok(k)
}

#[tauri::command]
async fn coursepage(
    state: tauri::State<'_, Mutex<Iclient>>,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    let mut result = (false, "".to_string());
    let _ = client.check();
    let m = client.loginactive;
    if !m {
        let _check = login_vtop(&mut client).await;
        result = _check;
    }
    let m = client.loginactive;
    if m {
        let html = client.get_course_page().await;
        if html.0 {
            let k = parsecoursepg::parse_semid(html.1);
            if k == "[]" {
                result = (false, k);
            } else {
                result = (true, k)
            }
        } else {
            result = html;
        }
    }

    Ok(result)
}

#[tauri::command]
async fn coursepage_courses(
    state: tauri::State<'_, Mutex<Iclient>>,
    semid: String,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    let mut result = (false, "".to_string());
    let _ = client.check();
    let m = client.loginactive;
    if !m {
        let _check = login_vtop(&mut client).await;
        result = _check;
    }
    let m = client.loginactive;
    if m {
        let html = client.get_course_courses(semid).await;
        if html.0 {
            let k = parsecoursepg::parse_courses(html.1);
            if k == "[]" {
                result = (false, k);
            } else {
                result = (true, k)
            }
        } else {
            result = html;
        }
    }

    Ok(result)
}

#[tauri::command]
async fn coursepage_classes(
    state: tauri::State<'_, Mutex<Iclient>>,
    semid: String,
    classid: String,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    let mut result = (false, "".to_string());
    let _ = client.check();
    let m = client.loginactive;
    if !m {
        let _check = login_vtop(&mut client).await;
        result = _check;
    }
    let m = client.loginactive;
    if m {
        let html = client.get_course_classes(semid, classid).await;
        if html.0 {
            let k = parsecoursepg::parse_classes(html.1);
            if k == "[]" {
                result = (false, k);
            } else {
                result = (true, k)
            }
        } else {
            result = html;
        }
    }

    Ok(result)
}

#[tauri::command]
async fn coursepage_dlist(
    state: tauri::State<'_, Mutex<Iclient>>,
    semid: String,
    classid: String,
    erp_id: String,
) -> Result<(bool, String), tauri::Error> {
    let mut client = state.lock().await;
    let mut result = (false, "".to_string());
    let _ = client.check();
    let m = client.loginactive;
    if !m {
        let _check = login_vtop(&mut client).await;
        result = _check;
    }
    let m = client.loginactive;
    if m {
        let html = client.get_course_dlist(semid, classid, erp_id).await;
        if html.0 {
            let k = parsecoursepg::parse_dlist(html.1);
            if k == "[]" {
                result = (false, k);
            } else {
                result = (true, k)
            }
        } else {
            result = html;
        }
    }

    Ok(result)
}

#[tauri::command]
async fn download_coursepage(
    state: tauri::State<'_, Mutex<Iclient>>,
    url: String,
) -> Result<String, tauri::Error> {
    let mut client = state.lock().await;
    let mut n = "NE".to_string();
    let m = client.loginactive;
    let _ = client.check();
    if !m {
        let _check = login_vtop(&mut client).await;
    }
    let m = client.loginactive;
    if m {
        client.vtop_download(url).await;
    }

    Ok(n)
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    tauri::Builder::default()
        .plugin(tauri_plugin_notification::init())
        .plugin(tauri_plugin_store::Builder::new().build())
        .plugin(tauri_plugin_http::init())
        .plugin(tauri_plugin_opener::init())
        .manage(Mutex::new(Iclient::new()))
        .invoke_handler(tauri::generate_handler![
            timetable_semid,
            timetable,
            attendance,
            full_attendance,
            attendance_semid,
            onstart_runcode,
            try_login,
            update_credtials_to,
            wifi,
            coursepage,
            coursepage_courses,
            coursepage_classes,
            coursepage_dlist,
            download_coursepage,
        ])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
