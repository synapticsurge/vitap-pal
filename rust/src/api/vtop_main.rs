use super::vtop::client::Iclient;
use base64::{engine::general_purpose::URL_SAFE, Engine as _};

async fn login_vtop(client: &mut Iclient) -> (bool, String) {
    let login_pg = client.login_pageload().await;
    let mut ans_cap = "".to_string();
    if login_pg.0 {
        let url_safe_encoded_data = URL_SAFE.encode(&client.captcha);
        match reqwest::get(format!(
            "https://cap.synapticsurge.in/cap/{}", //cap.synapticsurge.in
            url_safe_encoded_data
        ))
        .await
        {
            Ok(res) => {
                ans_cap = res.text().await.expect("failed");

        },
            Err(_e) => return (false, "NE".to_string()),
        }
    }
    let p = client.login(ans_cap.clone()).await;
    p
}

#[flutter_rust_bridge::frb()]
pub async fn get_client() -> Iclient {
    Iclient::new()
}

#[flutter_rust_bridge::frb()]
pub async fn check_client(iclient : &mut Iclient, username : String, password : String){
    iclient.update_cred(username, password);
}
#[flutter_rust_bridge::frb()]
pub async fn client_login(iclient : &mut Iclient)->(bool,String){
    login_vtop(iclient).await
    
}