// Touge Max 2
// #ID = 37031

// ADDRESSES

function opponentCar() => byte(0x06f610)

function currentSpeed() => word(0x06fc1e)

function currentGear() => byte(0x06fc55)

function transmission() => word(0x06fcb8)

function racePosition() => byte(0x6fd91)

function gameTimer() => word(0x6fdac)

function driftHealth() => word(0x6fdb8)

function currentDriftPoints() => word(0x6fdba)

function maxDriftPoints() => word(0x6fdbc)

function wallHits() => word(0x6fdbe)

function currentRoute() => byte(0x0708c8)

function currentCondition() => byte(0x0708c9)

function currentTrack() => byte(0x0708ca)

function currentHeat() => byte(0x0708cd)

function currentGamemode() => byte(0x0708cf)

function contextState() => byte(0x070905)

function truckHealth() => word(0x070918)

function distanceDriven() => word(0x07091a)

function currentCar() => byte(0x074c6b)

function hasPlayerControl() => byte(0x074e21)

function successStatus() => byte(0x074e4c)

function storySubMenu() => byte(0x0769b0)

function currentStoryMission() => byte(0x0769b4)

function schoolSubMenu() => byte(0x076a32)

function currentSchoolExam() => byte(0x076a36)

function hasFinished() => byte(0x07dbc4)

// other functions

// returns 1 if the car passed in parameter is unlocked, 0 if it isn't
function isCarUnlocked(id) => byte(0x074048+id)

// returns the number of cars currently unlocked
function totalCarsUnlocked(){
    n = 0
    for it in range(0,59){
        n = n + isCarUnlocked(it)
    }
    return n
}

// returns 1 if the story mission passed in parameter has been cleared (in one run), 0 if it hasn't
function isMissionCleared(id) => bit0(0x0769a2+id)

// returns the rank you got in story mode, 5 being hero
function storyRank(){
    n = 0
    for it in range(0,4){
        n = n + isMissionCleared(it)
    }
    return n
}

// ACHIEVEMENTS

// Driving School

// Lookup for exam IDs
ExamList = [
    {
        "ID": 0x00,
        "Exam": "1-1",
        "Points": 2,
    },
    {
        "ID": 0x01,
        "Exam": "1-2",
        "Points": 2,
    },
    {
        "ID": 0x02,
        "Exam": "1-3",
        "Points": 2,
    },
    {
        "ID": 0x03,
        "Exam": "1-4",
        "Points": 2,
    },
    {
        "ID": 0x04,
        "Exam": "1-5",
        "Points": 2,
    },
    {
        "ID": 0x0a,
        "Exam": "2-1",
        "Points": 3,
    },
    {
        "ID": 0x0b,
        "Exam": "2-2",
        "Points": 3,
    },
    {
        "ID": 0x0c,
        "Exam": "2-3",
        "Points": 3,
    },
    {
        "ID": 0x0d,
        "Exam": "2-4",
        "Points": 3,
    },
    {
        "ID": 0x0e,
        "Exam": "2-5",
        "Points": 3,
    },
    {
        "ID": 0x14,
        "Exam": "3-1",
        "Points": 5,
    },
    {
        "ID": 0x15,
        "Exam": "3-2",
        "Points": 5,
    },
    {
        "ID": 0x16,
        "Exam": "3-3",
        "Points": 5,
    },
    {
        "ID": 0x17,
        "Exam": "3-4",
        "Points": 5,
    },
]

// Driving School Achievements

for exam in ExamList{
    achievement(
        title = "Driving School " + exam["Exam"],
        points = exam["Points"],
        type = "progression",
        description = "Complete the Driving School Test " + exam["Exam"],
        trigger = contextState() == 1 &&
            currentGamemode() == 5 &&
            currentSchoolExam() == exam["ID"] &&
            prev(successStatus()) == 0 &&
            trigger_when(successStatus() == 1)
    )
}

// Standard Story Achievements

StoryTitles = [
    {
        "Title": "Not wasting any Time",
        "Desc": "Deliver the waste in time in Heat 1 of the Story",
        "MissionID": 0,
    },
    {
        "Title": "Pizza Boy",
        "Desc": "Deliver the orders in time in Heat 2 of the Story",
        "MissionID": 1,
    },
    {
        "Title": "What could go wrong?",
        "Desc": "Reach the bottom of the mountain without crashing in Heat 3 of the Story",
        "MissionID": 2,
    },
    {
        "Title": "A Mad Scientist",
        "Desc": "Destroy the Robot Car in time in Heat 4 of the Story",
        "MissionID": 3,
    },
    {
        "Title": "Special Operation",
        "Desc": "Reach the Port in time in Heat 5 of the Story",
        "MissionID": 4,
    },
]

for it in StoryTitles{
    achievement(
        title = it["Title"],
        points = 5,
        type = "progression",
        description = it["Desc"],
        trigger = contextState() == 1 &&
            currentGamemode() == 4 &&
            currentStoryMission() == it["MissionID"] &&
            prev(successStatus()) == 0 &&
            trigger_when(successStatus() == 1)
    )
}


// King Battle

// Lookup for track IDs
TrackListKB = {
    0x00: "Sky Line",
    0x01: "Night Cruise",
    0x02: "Big Bridge",
    0x03: "Double Ring",
    0x04: "Tight Down",
    0x05: "Mt. Snow",
    0x06: "Rock Island",
    0x07: "Dirt Way",
}

// Lookup for heat IDs
HeatList = [
    {
        "DiffID": 0,
        "HeatName": "Rookie",
        "Points": 2,
    },
    {
        "DiffID": 1,
        "HeatName": "Ace",
        "Points": 3,
    },
    {
        "DiffID": 2,
        "HeatName": "King",
        "Points": 5,
    },
]

// King Battle Achievements
for track in TrackListKB{
    for heat in HeatList{
        achievement(
            title = TrackListKB[track] + " " + heat["HeatName"],
            points = heat["Points"],
            type = "progression",
            description = format("Win a {0} Battle on {1}",heat["HeatName"],TrackListKB[track]),
            trigger = contextState() == 1 &&
                currentGamemode() == 0 &&
                currentTrack() == track &&
                currentHeat() == heat["DiffID"] &&
                trigger_when(
                    racePosition() == 1 &&
                    prev(hasFinished()) == 0 &&
                    hasFinished() == 1
                )
        )
    }
}

// vs Tsuchiya
achievement(
    title = "The Drift King",
    points = 10,
    type = "progression",
    description = "Beat Keichi Tsuchiya's F1 in King Battle on the Short Track",
    trigger = contextState() == 1 &&
        currentGamemode() == 0 &&
        currentTrack() == 8 &&
        opponentCar() == 0x1c && // MR_F-CAR
        trigger_when(
            racePosition() == 1 &&
            prev(hasFinished()) == 0 &&
            hasFinished() == 1
        )
)

// vs Tsuchiya 2
achievement(
    title = "The True Drift King",
    points = 10,
    description = "Beat Keichi Tsuchiya again in round 2 of King Battle on the Short Track",
    trigger = contextState() == 1 &&
        currentGamemode() == 0 &&
        currentTrack() == 8 &&
        opponentCar() == 0x1e && // 4WD_VIVI
        trigger_when(
            racePosition() == 1 &&
            prev(hasFinished()) == 0 &&
            hasFinished() == 1
        )
)

// Collect-a-thon Achievements
CarsCollection = [
    {
        "TrackID": 0,
        "Track": "Sky Line",
        "Title": "Lost Sanctuary",
        "CarID": 0x31,
    },
    {
        "TrackID": 1,
        "Track": "Night Cruise",
        "Title": "Gone Surfing",
        "CarID": 0x23,
    },
    {
        
        "TrackID": 2,
        "Track": "Big Bridge",
        "Title": "The End of the Tunnel",
        "CarID": 0x2f,
    },
    {
        "TrackID": 3,
        "Track": "Double Ring",
        "Title": "Pit Stop",
        "CarID": 0x33,
    },
    {
        "TrackID": 4,
        "Track": "Tight Down",
        "Title": "Impact Blue",
        "CarID": 0x35,
    },
    {
        "TrackID": 5,
        "Track": "Mt. Snow",
        "Title": "American Muscle",
        "CarID": 0x19,
    },
    {
        "TrackID": 6,
        "Track": "Rock Island",
        "Title": "Toyota Corolla!",
        "CarID": 0x28,
    },
    {
        "TrackID": 7,
        "Track": "Dirt Way",
        "Title": "I dig it!",
        "CarID": 0x39,
    },
    {
        "TrackID": 8,
        "Track": "Short Track",
        "Title": "This is Road Legal I swear",
        "CarID": 0x1b,
    },
    {
        "TrackID": 9,
        "Track": "School Zone",
        "Title": "Mr. Bean",
        "CarID": 0x32,
    },
]

for it in CarsCollection{
    achievement(
        title = it["Title"],
        points = 2,
        description = format("Find the hidden car at {0}",it["Track"]),
        trigger = contextState() == 1 &&
            currentGamemode() == 1 &&
            currentTrack() == it["TrackID"] &&
            prev(isCarUnlocked(it["CarID"]) == 0) &&
            trigger_when(isCarUnlocked(it["CarID"]) == 1)
    )
}

// Collect every car achievement
achievement(
    title = "Car Collector",
    points = 25,
    description = "Unlock every car",
    trigger = (
            (
                contextState() == 1 && 
                currentGamemode() == 1 // if last car unlocked is a collectable
            ) ||
            (once(
                    prev(successStatus()) == 0 &&
                    successStatus() == 1
                ) &&
                currentGamemode() == 4 &&
                never(contextState() == 0) &&
                never(storySubMenu() != 0) // if last car unlocked is a story reward
            ) ||
            (
                currentGamemode() == 5 &&
                never(contextState() == 0) &&
                never(schoolSubMenu() != 0) &&
                currentSchoolExam() == 0x17 // if last car unlocked is a school test reward
            ) ||
            (currentGamemode() == 0) &&
            contextState() == 1 &&
            currentTrack() == 8 // if last car unlocked is Tsuchiya's F1
        ) &&
        prev(totalCarsUnlocked() == 59) &&
        totalCarsUnlocked() == 60
)

// Challenge Achievements

// Hero rank
achievement(
    title = "A Successful Date",
    points = 5,
    description = "Complete the Story with a Hero ranking",
    trigger = currentStoryMission() == 4 &&
        contextState() == 4 &&
        prev(storyRank()) == 4 &&
        storyRank() == 5
)

// 320km/h
achievement(
    title = "Speed, I am Speed",
    points = 5,
    description = "Reach 320 km/h",
    trigger = contextState() == 1 &&
        prev(currentSpeed() == 319) &&
        currentSpeed() == 320
)

// 300 km/h on school 1-1
achievement(
    title = "Taking a Head Start",
    points = 3,
    description = "Reach 300km/h on School Test 1-1",
    trigger = contextState() == 1 &&
        currentGamemode() == 5 &&
        currentSchoolExam() == 0 &&
        prev(currentSpeed() == 299) &&
        currentSpeed() == 300
)

// Manual Gears Achievement
achievement(
    title = "Short Shifting",
    points = 2,
    description = "Win any race using manual gears only",
    trigger = once(
            prev(hasPlayerControl()) == 0 &&
            hasPlayerControl() == 1 &&
            transmission() == 0
        ) &&
        contextState() == 1 &&
        currentGamemode() == 0 &&
        never(transmission() != 0) &&
        trigger_when(
            racePosition() == 1 &&
            prev(hasFinished()) == 0 &&
            hasFinished() == 1
        )
)

// 1st gear only
achievement(
    title = "Toyota Prius II",
    points = 5,
    description = "Win a race while being in 1st gear from start to finish (special vehicles not allowed)",
    trigger = once(
            prev(hasPlayerControl()) == 0 &&
            hasPlayerControl() == 1
        ) &&
        contextState() == 1 &&
        currentGamemode() == 0 &&
        currentCar() < 0x34 &&
        never(currentGear() > 1) &&
        trigger_when(
            racePosition() == 1 &&
            prev(hasFinished()) == 0 &&
            hasFinished() == 1
        )
)

// full combo drift
achievement(
    title = "Stay Sideways",
    points = 10,
    description = "Complete a race without ever losing your drift combo",
    trigger = contextState() == 1 &&
        once(
            prev(currentDriftPoints()) == 0 &&
            currentDriftPoints() > 0 &&
            gameTimer() < 600
        ) &&
        currentGamemode() != 1 &&
        currentGamemode() < 3 &&
        never(driftHealth() == 0) &&
        never(prev(wallHits()) < wallHits()) &&
        prev(successStatus() == 0) &&
        trigger_when(successStatus() == 1)
)

// 5000 drift points
achievement(
    title = "Uncrowned Monarch",
    points = 10,
    description = "Accumulate 5000 Drift Points in a single run",
    trigger = contextState() == 1 &&
        hasPlayerControl() == 1 &&
        prev(maxDriftPoints()) >= 4950 &&
        prev(maxDriftPoints()) <= 4999 &&
        trigger_when(maxDriftPoints() >= 5000)
)

// King Heat w/ Light Car
achievement(
    title = "Underpowered",
    points = 10,
    description = "Complete a King Battle in King difficulty with a light class car",
    trigger = contextState() == 1 &&
        currentGamemode() == 0 &&
        currentHeat() == 2 &&
        currentCar() <= 0x07 &&
        trigger_when(
            racePosition() == 1 &&
            prev(hasFinished()) == 0 &&
            hasFinished() == 1
        )
)

// Story Heat 1 w/ 80% health remaining
achievement(
    title = "Careful Driving",
    points = 10,
    description = "Complete Heat 1 of the story with at least 80% of health left",
    trigger = contextState() == 1 &&
        currentGamemode() == 4 &&
        currentStoryMission() == 0 &&
        truckHealth() >= 480 && // max is 258(16)=600(10)
        prev(successStatus() == 0) &&
        trigger_when(successStatus() == 1)
)

// Story Heat 4 in under 1:40 (subject to adjustments)
achievement(
    title = "Killing Machine",
    points = 10,
    description = "Destroy the Robot car in under 1:40",
    trigger = contextState() == 1 &&
        currentGamemode() == 4 &&
        currentStoryMission() == 3 &&
        gameTimer() < 6000 &&
        prev(successStatus() == 0) &&
        trigger_when(successStatus() == 1)
)

// Special Vehicles
SpecialsPoints = [
    {
        "Title": "Four Legs Drive",
        "Desc": "sheep",
        "Points": 5,
        "CarID": 0x36,
    },
    {
        "Title": "Powered Rails",
        "Desc": "minecart",
        "Points": 5,
        "CarID": 0x3a,
    },
    {
        "Title": "Lone Digger",
        "Desc": "excavator",
        "Points": 10,
        "CarID": 0x39,
    },
    {
        "Title": "Mini Monster",
        "Desc": "MIZE2",
        "Points": 10,
        "CarID": 0x23,
    },
]

for it in SpecialsPoints{
    achievement(
        title = it["Title"],
        points = it["Points"],
        description = format("In King Battle mode, win any duel using the {0}",it["Desc"]),
        trigger = contextState() == 1 &&
            currentGamemode() == 0 &&
            currentCar() == it["CarID"] &&
            trigger_when(
            racePosition() == 1 &&
            prev(hasFinished()) == 0 &&
            hasFinished() == 1
        )
    )
}

// Time Trial Achievements

TimeTrials = [
    {
        "Title": "Hachiroku",
        "Desc": "1:45 in Sky Line using the FR_TREN (route left, any condition)",
        "TrackID": 0,
        "CarID": 0,
        "TimeReq": 6300,
        "RouteID": 1,
    },
    {
        "Title": "Shutoku Battle",
        "Desc": "1:08 in Night Cruise using the RR_P911 (route right, any condition)",
        "TrackID": 1,
        "CarID": 0x18,
        "TimeReq": 4080,
        "RouteID": 0,
    },
    {
        "Title": "Most Wanted",
        "Desc": "2:20 in Big Bridge using the FR_BM3 (route right, any condition)",
        "TrackID": 2,
        "CarID": 0x1a,
        "TimeReq": 8400,
        "RouteID": 0,
    },
    {
        "Title": "The Gigachino Reigns",
        "Desc": "2:02 in Double Ring using the FR_CAPU (route right, any condition)",
        "TrackID": 3,
        "CarID": 0x20,
        "TimeReq": 7320,
        "RouteID": 0,
    },
    {
        "Title": "Kansei Dorifto",
        "Desc": "2:40 in Tight Down using the FR_FD7 (route right, any condition)",
        "TrackID": 4,
        "CarID": 0,
        "TimeReq": 9600,
        "RouteID": 0,
    },
    {
        "Title": "Cozy Cossie",
        "Desc": "2:26 in Mt. Snow using the 4WD_ESCO (route right, any condition)",
        "TrackID": 5,
        "CarID": 0x25,
        "TimeReq": 8760,
        "RouteID": 0,
    },
    {
        "Title": "When in doubt, Flat Out",
        "Desc": "2:07 in Rock Island using the 4WD_IMP (route left, any condition)",
        "TrackID": 6,
        "CarID": 0x27,
        "TimeReq": 7620,
        "RouteID": 1,
    },
    {
        "Title": "Family Trip",
        "Desc": "2:16 in Dirt Way using the 4WD_STAG (route right, any condition)",
        "TrackID": 7,
        "CarID": 0x2c,
        "TimeReq": 8160,
        "RouteID": 0,
    },
    {
        "Title": "Going Professional",
        "Desc": "1:08 in Short Track using the MR_GT390 (route right, any condition)",
        "TrackID": 8,
        "CarID": 0x1b,
        "TimeReq": 4080,
        "RouteID": 0,
    },
    {
        "Title": "Nothing more to learn",
        "Desc": "1:22 in School Zone using the MR_F-CAR (route left, any condition)",
        "TrackID": 9,
        "CarID": 0x1c,
        "TimeReq": 4920,
        "RouteID": 1,
    },
]

for it in TimeTrials{
    achievement(
        title = it["Title"],
        points = 5,
        description = format("In Time Trial, achieve a time of {0}",it["Desc"]),
        trigger = contextState() == 1 &&
            currentGamemode() == 2 &&
            currentTrack() == it["TrackID"] &&
            currentRoute() == it["RouteID"] &&
            currentCar() == it["CarID"] &&
            gameTimer() <= it["TimeReq"] &&
            prev(hasFinished() == 0) &&
            trigger_when(hasFinished() == 1)
    )
}

// Lookups for RP and LBs

TrackLookup = {
    0x00: "Sky Line",
    0x01: "Night Cruise",
    0x02: "Big Bridge",
    0x03: "Double Ring",
    0x04: "Tight Down",
    0x05: "Mt. Snow",
    0x06: "Rock Island",
    0x07: "Dirt Way",
    0x08: "Short Track",
    0x09: "School Zone",
}

CarLookup = {
    0x00: "FR_TREN",
    0x01: "FF_CIVI",
    0x02: "FR_ROAD",
    0x03: "MR_AMR2",
    0x04: "FR_LEVI",
    0x05: "FF_STAR",
    0x06: "FF_CXR",
    0x07: "FF_PRIM",
    0x08: "FR_SILV",
    0x09: "FR_180",
    0x0a: "FR_FC7",
    0x0b: "FR_SMR2",
    0x0c: "FR_LAUR",
    0x0d: "FF_INTG",
    0x0e: "FR_14S",
    0x0f: "FF_FOT",
    0x10: "4WD_32R",
    0x11: "FR_SUPR",
    0x12: "FR_FD7",
    0x13: "FR_32Z",
    0x14: "4WD_33R",
    0x15: "4WD_GOT",
    0x16: "FR_CHES",
    0x17: "MR_NXS",
    0x18: "RR_P911",
    0x19: "FR_COVET",
    0x1a: "FR_BM3",
    0x1b: "MR_GT390",
    0x1c: "MR_F-CAR",
    0x1d: "FR_BAKYU",
    0x1e: "4WD_VIVI",
    0x1f: "FF_ALT",
    0x20: "FR_CAPU",
    0x21: "FF_WAGO",
    0x22: "MR_BIET",
    0x23: "FR_MIZE2",
    0x24: "4WD_PULS",
    0x25: "4WD_ESCO",
    0x26: "4WD_LAN",
    0x27: "4WD_IMP",
    0x28: "4WD_CARO",
    0x29: "4WD_LEGA",
    0x2a: "FF_AKODO",
    0x2b: "FR_MAKU2",
    0x2c: "4WD_STAG",
    0x2d: "4WD_SVR4",
    0x2e: "FR_STAR6",
    0x2f: "FR_D30RS",
    0x30: "FR_SA7",
    0x31: "FR_JEMIN",
    0x32: "FF_CMINI",
    0x33: "RR_FI500",
    0x34: "MR_NXS_T",
    0x35: "FR_SIL18",
    0x36: "4LD_SHEP",
    0x37: "6WD_TY87",
    0x38: "MR_PIZZA",
    0x39: "4WD_SHVL",
    0x3a: "???_TORO",
    0x3b: "4WD_ROBO",
}

GamemodeLookup = {
    0x00: "King Battle",
    0x01: "Freerun",
    0x02: "Time Attack",
    0x04: "Story",
    0x05: "School",
}

DifficultyLookup = {
    0x00: "Rookie",
    0x01: "Ace",
    0x02: "King",
}

StoryLookup = {
    0x00: "Heat 1",
    0x01: "Heat 2",
    0x02: "Heat 3",
    0x03: "Heat 4",
    0x04: "Heat 5",
}

SchoolLookup = {
    0x00: "1-1",
    0x01: "1-2",
    0x02: "1-3",
    0x03: "1-4",
    0x04: "1-5",
    0x0a: "2-1",
    0x0b: "2-2",
    0x0c: "2-3",
    0x0d: "2-4",
    0x0e: "2-5",
    0x14: "3-1",
    0x15: "3-2",
    0x16: "3-3",
    0x17: "3-4",
    0x64: "1-1",
    0x65: "1-2",
    0x66: "1-3",
    0x67: "1-4",
    0x68: "1-5",
    0x6e: "2-1",
    0x6f: "2-2",
    0x70: "2-3",
    0x71: "2-4",
    0x72: "2-5",
    0x78: "3-1",
    0x79: "3-2",
    0x7a: "3-3",
    0x7b: "3-4",
}

RouteLookup = {
    0x00: "right",
    0x01: "left",
}

// RICH PRESENCE

rich_presence_conditional_display(
    contextState() == 1 &&
    currentGamemode() == 0 &&
    currentTrack() != 8,
    "Challenging a {0} in a {1} on {2} ({3} difficulty)",
    rich_presence_lookup("Rival",opponentCar(),CarLookup),
    rich_presence_lookup("Car",currentCar(),CarLookup),
    rich_presence_lookup("Track",currentTrack(),TrackLookup),
    rich_presence_lookup("Difficulty",currentHeat(),DifficultyLookup)
)

rich_presence_conditional_display(
    contextState() == 1 &&
    currentGamemode() == 0 &&
    currentTrack() == 8,
    "Challenging the Drift King Keichi Tsuchiya on Short Track with a {0}",
    rich_presence_lookup("Car",currentCar(),CarLookup)
)

rich_presence_conditional_display(
    contextState() == 1 &&
    currentGamemode() > 0 &&
    currentGamemode() < 4,
    "Driving a {0} on {1} in {2}",
    rich_presence_lookup("Car",currentCar(),CarLookup),
    rich_presence_lookup("Track",currentTrack(),TrackLookup),
    rich_presence_lookup("Mode",currentGamemode(),GamemodeLookup)
)

rich_presence_conditional_display(
    contextState() == 1 &&
    currentGamemode() == 4,
    "In {0} of story mode",
    rich_presence_lookup("StoryHeat",currentStoryMission(),StoryLookup)
)

rich_presence_conditional_display(
    contextState() == 1 &&
    currentGamemode() == 5 &&
    currentSchoolExam() < 0x60,
    "In driving school, test {0}",
    rich_presence_lookup("SchoolTest",currentSchoolExam(),SchoolLookup)
)

rich_presence_conditional_display(
    contextState() == 1 &&
    currentGamemode() == 5 &&
    currentSchoolExam() > 0x60,
    "In round 2 of driving school, test {0}",
    rich_presence_lookup("SchoolTest",currentSchoolExam(),SchoolLookup)
)

rich_presence_conditional_display(
    contextState() == 2,
    "Watching a replay"
)

rich_presence_conditional_display(
    contextState() == 4,
    "Watching a cutscene"
)

rich_presence_conditional_display(
    contextState() == 7,
    "Watching credits"
)

rich_presence_display("In menus")

// LEADERBOARDS

// Time Attack
function StartTT(track,route) => contextState() == 1 &&
    currentGamemode() == 2 &&
    currentTrack() == track &&
    currentRoute() == route &&
    gameTimer() > 1800 &&
    prev(hasFinished() == 0) &&
    hasFinished() == 1

// Instant start submit trick
function Cancel() => always_false()

function Submit() => always_true()

// Highest Drift Combo
leaderboard(
    "Highest Drift Combo",
    "Achieve the highest drift score",
    contextState() == 1 &&
    prev(hasPlayerControl() == 1) &&
    hasPlayerControl() == 0 &&
    maxDriftPoints() != 0,
    Cancel(),
    Submit(),
    value = prev(maxDriftPoints())
)

// Time attack leaderboards
for track in TrackLookup{
    for route in RouteLookup{
        leaderboard(
            TrackLookup[track] + " Best Time (Route " + RouteLookup[route] + ")",
            "Fastest time on " + TrackLookup[track] + " (Route" + RouteLookup[route] + ") in time attack",
            StartTT(track,route),
            Cancel(),
            Submit(),
            value = gameTimer()*5/3,
            format = "MILLISECS",
            lower_is_better = true
        )
    }
}

// School

// Tests list
ExamsData = [
    {
        "ID1": 0x00,
        "Name": "1-1",
        "Type": "time",
    },
    {
        "ID1": 0x01,
        "Name": "1-2",
        "Type": "time",
    },
    {
        "ID1": 0x02,
        "Name": "1-3",
        "Type": "drift score",
    },
    {
        "ID1": 0x03,
        "Name": "1-4",
        "Type": "time",
    },
    {
        "ID1": 0x04,
        "Name": "1-5",
        "Type": "time",
    },
    {
        "ID1": 0x0a,
        "Name": "2-1",
        "Type": "time",
    },
    {
        "ID1": 0x0b,
        "Name": "2-2",
        "Type": "time",
    },
    {
        "ID1": 0x0c,
        "Name": "2-3",
        "Type": "time",
    },
    {
        "ID1": 0x0d,
        "Name": "2-4",
        "Type": "time",
    },
    {
        "ID1": 0x0e,
        "ID2": 0x72,
        "Name": "2-5",
        "Type": "time",
    },
    {
        "ID1": 0x14,
        "Name": "3-1",
        "Type": "drift score",
    },
    {
        "ID1": 0x15,
        "Name": "3-2",
        "Type": "average speed",
    },
    {
        "ID1": 0x16,
        "Name": "3-3",
        "Type": "time",
    },
    {
        "ID1": 0x17,
        "Name": "3-4",
        "Type": "time",
    },
]

// returns the average speed for 3-2
function avgSpeed(){
    return 180*prev(distanceDriven())/gameTimer()
}

function StartExam(exam) => contextState() == 1 &&
    currentGamemode() == 5 &&
    (
        currentSchoolExam() == exam ||
        currentSchoolExam() == exam + 100 // for round 2
    ) &&
    prev(successStatus() == 0) &&
    successStatus() == 1

// School exams leaderboards, with a different type of value submitted  depending on the type of test
for it in ExamsData{
    if(it["Type"] == "time"){
        score = gameTimer()*5/3
        LIS = true
        outputType = "MILLISECS"
    }
    if(it["Type"] == "drift score"){
        score = maxDriftPoints()
        LIS = false
        outputType = "VALUE"
    }
    if(it["Type"] == "average speed"){
        score = avgSpeed()
        LIS = false
        outputType = "VALUE"
    }
    
    leaderboard(
        "School " + it["Name"] + " high score",
        "Best " + it["Type"] + " on school test " + it["Name"],
        StartExam(it["ID1"]),
        Cancel(),
        Submit(),
        value = score,
        format = outputType,
        lower_is_better = LIS
    )
}

// Story Speedruns Leaderboards
function StartMission(mission) => contextState() == 1 &&
    currentGamemode() == 4 &&
    currentStoryMission() == mission &&
    gameTimer() > 600 &&
    prev(hasFinished() == 0) &&
    hasFinished() == 1

for it in StoryLookup{
    leaderboard(
        StoryLookup[it] + " Story Speedrun",
        "Fastest time on " + StoryLookup[it] + " in Story mode",
        StartMission(it),
        Cancel(),
        Submit(),
        value = gameTimer()*5/3,
        format = "MILLISECS",
        lower_is_better = true
    )
}

