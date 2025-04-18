use super::vtop::client::Iclient;
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
