use super::vtop::{
    client::Iclient,
    parsett, types::Timetable,
};
use base64::{engine::general_purpose::URL_SAFE, Engine as _};

async fn login_vtop(client: &mut Iclient) -> (bool, String) {
    for _ in 0..4 {
        let login_pg = client.login_pageload().await;
        let mut ans_cap = "".to_string();
        if login_pg.0 {
            let url_safe_encoded_data = URL_SAFE.encode(&client.captcha);
            match reqwest::get(format!(
                "https://cap.va.synaptic.gg/cap/{}",
                url_safe_encoded_data
            ))
            .await
            {
                Ok(res) => {
                    ans_cap = res.text().await.expect("failed");
                }
                Err(_e) => return (false, "NE".to_string()),
            }
        }
        let p = client.login(ans_cap.clone()).await;
        if p.1 != "Invalid Captcha".to_string() {
            return p;
        }
    }
    (false, "NE".to_string())
}

#[flutter_rust_bridge::frb(sync)]
pub fn get_client() -> Iclient {
    Iclient::new()
}

#[flutter_rust_bridge::frb()]
pub async fn check_client(iclient: &mut Iclient, username: String, password: String) {
    iclient.update_cred(username, password);
}

#[flutter_rust_bridge::frb()]
pub async fn onstart_run(
    iclient: &mut Iclient,
    username: String,
    password: String,
) -> (bool, String) {
    let m = iclient.loginactive;
    iclient.update_cred(username, password);
    let mut k = (m, "LA".to_string());
    if !m {
        k = login_vtop(iclient).await;
    }
    k
}

#[flutter_rust_bridge::frb()]
pub async fn rust_timetable_semid(client: &mut Iclient) -> (bool, String,Vec<String> ) {
    let mut result = (false, "".to_string(),vec![]);

    let m = client.loginactive;
    if !m {
        let _check = login_vtop(client).await;
        result = (_check.0,_check.1,vec![]);
    }
    let m = client.loginactive;
    if m {
        let html = client.get_timetable_page().await;
        if html.0 {
            let k = parsett::parse_semid_timetable(html.1);
            if k.is_empty() {
                result = (false, "".to_string(),k);
            } else {
                result = (true, "".to_string(),k)
            }
        } else {
            result = (html.0,html.1,vec![]);
        }
    }

    result
}

#[flutter_rust_bridge::frb()]
pub async fn rust_timetable(client: &mut Iclient, semid: String) -> (bool, String,Vec<Timetable>) {
    let mut result = (false, "".to_string(),vec![]);

    let m = client.loginactive;
    if !m {
        let _check = login_vtop(client).await;
        result = (_check.0,_check.1,vec![]);
    }
    let m = client.loginactive;
    if m {
        let res = client.get_timetable(semid).await;
        if res.0 {
            let k = parsett::parse_timetable(res.1);
            if k.is_empty() {
                result = (false, "".to_string(),k);
            } else {
                result = (true, "".to_string(),k)
            }
        } else {
            result = (res.0,res.1,vec![]);
        }
    }
    result
}
