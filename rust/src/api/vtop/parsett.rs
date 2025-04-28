use std::collections::HashMap;
use scraper::{Html, Selector};
use serde;
use serde::Deserialize;

use super::types::RTimetable;

pub fn parse_timetable(html: String) -> Vec<RTimetable> {
    #[derive(serde::Serialize, Deserialize)]
    struct Timeing {
        serial: String,
        start_time: String,
        end_time: String,
    }
    let mut classname_code: HashMap<String, String> = HashMap::new();
    let document = Html::parse_document(&html);
    let rows_selector = Selector::parse("tr").unwrap();
    let mut timetables: Vec<RTimetable> = Vec::new();
    let mut timeings_temp: Vec<Timeing> = Vec::new();
    let mut count_for_offset = 0;
    let mut day = "".to_string();

    for row in document.select(&rows_selector).skip(1) {
        let mut cells: Vec<_> = row.select(&Selector::parse("td").unwrap()).collect();
        if cells.len() > 19 {
            if count_for_offset % 2 == 0 {
                day = cells[0]
                    .text()
                    .collect::<Vec<_>>()
                    .join("")
                    .trim()
                    .replace("\t", "")
                    .replace("\n", "");
                cells.remove(0);
            }

            for (index, val) in cells.iter().enumerate() {
                if count_for_offset < 2 {
                    if count_for_offset == 0 {
                        let timeing = Timeing {
                            serial: index.to_string(),
                            start_time: val
                                .text()
                                .collect::<Vec<_>>()
                                .join("")
                                .trim()
                                .replace("\t", "")
                                .replace("\n", ""),
                            end_time: "".to_string(),
                        };
                        timeings_temp.push(timeing);
                    } else if count_for_offset == 1 {
                        if let Some(timeing) = timeings_temp.get_mut(index) {
                            timeing.end_time = val
                                .text()
                                .collect::<Vec<_>>()
                                .join("")
                                .trim()
                                .replace("\t", "")
                                .replace("\n", "");
                        }
                    }
                } else if count_for_offset > 3 {
                    let class_name = val
                        .text()
                        .collect::<Vec<_>>()
                        .join("")
                        .trim()
                        .replace("\t", "")
                        .replace("\n", "");
                    if class_name.len() > 5 && index != 0 {
                        let cle = class_name
                            .split("-")
                            .filter(|k| !k.is_empty())
                            .collect::<Vec<_>>();
                        if cle.len() > 2 {

                            let mut cl = class_name.split("-");
                            let code = class_name.split("-").nth(1).unwrap_or("").trim().to_string();
                            let class = RTimetable {
                                serial: index.to_string(),
                                day: day.clone(),
                                slot: cl.next().unwrap_or("").trim().to_string(),
                                course_code: cl.next().unwrap_or("").trim().to_string(),
                                course_type: cl.next().unwrap_or("").trim().to_string(),
                                room_no: cl.next().unwrap_or("").trim().to_string(),
                                block: cl.take(2).collect::<Vec<_>>().join(" "),
                                start_time: "".to_string(),
                                end_time: "".to_string(),
                                name: classname_code.get(&code).unwrap_or(&"".to_string()).to_string(),
                            };
                            timetables.push(class);
                        }
                    }
                }
            }
            count_for_offset += 1;
        }else if cells.len() > 10 {
            let cname =  cells[2]
            .text()
            .collect::<Vec<_>>()
            .join("")
            .trim()
            .replace("\t", "")
            .replace("\n", "");
        let tep = cname.split("-").filter(|k| !k.is_empty())
        .collect::<Vec<_>>();
    if tep.len() >1{
            let code = tep[0].trim().to_string();
            let name = tep[1].to_string().split_once("(").unwrap_or(("","")).0.trim().to_string();
           if !classname_code.contains_key(&code){
            classname_code.insert(code, name);
           }
            
        }
            
        }
    }
    for timetable in &mut timetables {
        if let Some(times) = timeings_temp.iter().find(|t| t.serial == timetable.serial) {
            timetable.start_time = times.start_time.clone();
            timetable.end_time = times.end_time.clone();
        }
    }


    return timetables;
}
pub fn parse_semid_timetable(html: String) -> Vec<String> {
    let mut sem_names_ids = vec![];
    let document = Html::parse_document(&html);
    let selector = Selector::parse(r#"select[name="semesterSubId"] option"#).unwrap();
    for element in document.select(&selector).skip(1) {
        if let Some(value) = element.value().attr("value") {
            if let Some(name) = element.text().next() {
                sem_names_ids.push(format!(
                    "{}:{}",
                    name.trim().replace("- AMR", "").to_string(),
                    value.trim().to_string()
                ));
            }
        }
    }
    sem_names_ids
}
