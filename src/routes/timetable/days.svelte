<script lang="ts">
  import { onMount, untrack } from "svelte";
  let { full_timetable_list } = $props();
  let render: undefined | string = $state(undefined);
  //@ts-ignore
  let days = $state([]);
  let group = $state("TUE");

  $effect(() => {
    //console.log("running effect days");
    try {
      let timetable = JSON.parse(full_timetable_list);
      for (let i = 0; i < timetable.length; i++) {
        const de = timetable[i].day;
        if (!days.includes(de)) {
          days.push(de);
        }

        //@ts-ignore
        const schedule = timetable.reduce((acc, course) => {
          if (!acc[course.day]) {
            acc[course.day] = [];
          }
          acc[course.day].push(course);
          return acc;
        }, {});

        for (const day in schedule) {
          //@ts-ignore
          schedule[day].sort((a, b) => {
            const timeA = a.start_time.split(":").join("");
            const timeB = b.start_time.split(":").join("");
            return timeA - timeB;
          });
        }
        for (const days in schedule) {
          schedule[days] = getdaywithleasure(schedule[days]);
        }

        render = schedule;

        //@ts-ignore
        function timeDifferenceInMinutes(start, end) {
          const startParts = start.split(":");
          const endParts = end.split(":");

          const startMinutes =
            parseInt(startParts[0]) * 60 + parseInt(startParts[1]);
          const endMinutes = parseInt(endParts[0]) * 60 + parseInt(endParts[1]);
          return endMinutes - startMinutes;
        }
        //@ts-ignore
        function getdaywithleasure(dayta) {
          for (let i = 0; i < dayta.length - 1; i++) {
            const currentclass = dayta[i];
            const nextclass = dayta[i + 1];

            let n = timeDifferenceInMinutes(
              String(currentclass.end_time),
              String(nextclass.start_time),
            );
            if (n > 60) {
              let noOfFree = Math.floor(n / 60);
              const leasureclass = {
                block: "-",
                course_code: "-",
                course_type: "-",
                day: "MON",
                start_time: currentclass.end_time,
                end_time: nextclass.start_time,
                room_no: "-",
                serial: "-1",
                slot: `${noOfFree}`,
              };
              dayta.splice(i + 1, 0, leasureclass);
            }
          }
          return dayta;
        }
      }
    } catch (e) {
      render = "loading";
      if (full_timetable_list != undefined && full_timetable_list != "") {
        render = full_timetable_list;
      }
    }
  });

  //@ts-ignore
  function convertTo12HourFormat(time24) {
    const [hour, minute] = time24.split(":").map(Number);
    const period = hour >= 12 ? "PM" : "AM";
    const hour12 = hour % 12 || 12;
    return `${hour12}:${minute.toString().padStart(2, "0")} ${period}`;
  }

  const dayNames = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  let today = new Date();
  let sel_today = dayNames[today.getDay()];

  function handeltabclick(e) {
    let k = e.target.value;
    group = k;
  }

  onMount(() => {
    const dayNames = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
    let today = new Date();
    let sel_today = dayNames[today.getDay()];
    if (days.includes(sel_today)) {
      group = sel_today;
    } else {
      group = days[0] == undefined ? "TUE" : days[0];
    }
  });
</script>

<div class="flex flex-col gap-4 min-h-[85vh]">
  <div class="grow">
    <div class="">
      {#if render != undefined}
        <div role="tablist" class="tabs tabs-border flex justify-evenly">
          {#each days as i}
            <input
              type="radio"
              name="my_tabs_2"
              id={i}
              value={i}
              onclick={(e) => handeltabclick(e)}
              class="tab"
              aria-label={i}
              bind:group
            />
          {/each}
        </div>
        <div class=" whitespace-nowrap overflow-auto">
          <ul class="list bg-base-100 rounded-box shadow-md p-1">
            {#each render[group] as day}
              {#if day.serial != "-1"}
                <li class="list-row">
                  <div class="text-4xl font-thin tabular-nums">
                    <div
                      class="status animate-bounce {day.course_type.endsWith(
                        'TH',
                      )
                        ? 'status-primary'
                        : 'status-secondary'}"
                    ></div>
                  </div>
                  <div>
                    <div>{day.course_code}</div>
                    <div class="text-xs uppercase font-semibold opacity-60">
                      {convertTo12HourFormat(day.start_time)} - {convertTo12HourFormat(
                        day.end_time,
                      )}
                    </div>
                  </div>
                  <button class="btn btn-square btn-ghost">
                    {day.block.replace("ALL", "")}
                  </button>

                  <button class="btn btn-square btn-ghost">
                    {day.room_no}
                  </button>
                </li>
              {:else}
                <li class="list-row">
                  <div class="text-4xl font-thin tabular-nums">
                    <div
                      aria-label="success"
                      class="status animate-bounce status-accent"
                    ></div>
                  </div>
                  <div>
                    <div>FreeTime</div>
                    <div class="text-xs uppercase font-semibold opacity-60">
                      {convertTo12HourFormat(day.start_time)} - {convertTo12HourFormat(
                        day.end_time,
                      )}
                    </div>
                  </div>

                  <button class="btn btn-square btn-ghost">
                    {day.slot}
                  </button>

                  <button class="btn btn-square btn-ghost text-sm">
                    {day.slot == 1 ? "slot" : "slots"}
                  </button>
                </li>
              {/if}
            {/each}
          </ul>
        </div>
      {:else}
        <p></p>
      {/if}
    </div>
  </div>
  <div class="w-full translate-y-[-3rem]">
    <footer class=" flex items-center justify-between gap-4 p-4">
      <small
        ><div class="status animate-bounce status-primary"></div>
        Therory</small
      >
      <small>
        <div class="status animate-bounce status-secondary"></div>
        Labs</small
      >
      <small
        ><div
          aria-label="success"
          class="status animate-bounce status-accent"
        ></div>
        FreeTime</small
      >
    </footer>
  </div>
</div>
