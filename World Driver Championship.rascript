// World Driver Championship
// #ID = 10091

// REGION CHECK
RegionVarNtsc = dword(0x097f88)
RegionVarPal = dword(0x099CA8)
US = 0x80098bf8
EU = 0x8009a828
Regions = [US,EU]

// Using a pauseif here to avoid the PAL addresses to trigger resetifs while playing on ntsc and vice versa
function IsRegion(region){
    return region == US && unless(region != RegionVarNtsc) ||
    region == EU && unless(region != RegionVarPal)
}

// Made a secondary region check without the pauseif, specifically for the leaderboards
function IsRegionLB(region){
    return region == US && region == RegionVarNtsc ||
    region == EU && region == RegionVarPal
}


// ADDRESSES
IsCarVisible = {
    US: 0x07D808,
    EU: 0x07F1C8
}

IsOnResultScreen = {
    US: 0x07DF88,
    EU: 0x07f948
}

WherePlayer = {
    US: 0x07DF94,
    EU: 0x07F954
}

RaceFrameCounter = {
    US: 0x07E018,
    EU: 0x07F9D8
}

BlackCars = {
    US: 0x07DF7C,
    EU: 0x07F93C
}

FirstPlaceId = {
    US: 0x07E510,
    EU: 0x07FED0
}

SmallCars = {
    US: 0x07E8D0,
    EU: 0x080290
}

BlurryMode = {
    US: 0x07E930,
    EU: 0x0802F0
}

CurrentCar = {
    US: 0x092368,
    EU: 0x093D58
}

CurrentGamemode = {
    US: 0x0923E4,
    EU: 0x093DD4
}

CurrentChampionship = {
    US: 0x0923F4,
    EU: 0x093DE4
}

CurrentRace = {
    US: 0x0923F8,
    EU: 0x093DE8
}

MenuMode = {
    US: 0x092994,
    EU: 0x094384
}

ResultScreenPage = {
    US: 0x092CB0,
    EU: 0x094680
}

Countdown = {
    US: 0x092CC8,
    EU: 0x094698
}

SaveName = {
    US: 0x094E70,
    EU: 0x096870
}

CurrentPoints = {
    US: 0x097D10,
    EU: 0x099A30
}

EventsWon = {
    US: 0x097D18,
    EU: 0x099A38
}

EventsDone = {
    US: 0x097D28,
    EU: 0x099A48
}

ChampData = {
    US: 0x097F80,
    EU: 0x099CA0
}

CarUnlocks = {
    US: 0x09884E,
    EU: 0x09A56E
}

RestartCredits = {
    US: 0x098D60,
    EU: 0x09AA80
}

CurrentTrack = {
    US: 0x098D68,
    EU: 0x09AA88
}

CurrentChampionshipPoints = {
    US: 0x098D80,
    EU: 0x09AAA0
}

ChampionshipFirstPlace = {
    US: 0x098DBC,
    EU: 0x09AADC
}

Winner = {
    US: 0x098DDC,
    EU: 0x09AAFC
}

InfiniteRestarts = {
    US: 0x098DFC,
    EU: 0x09AB1C
}

Gearbox = {
    US: 0x99978,
    EU: 0x9B608
}

CameraVerticalAngle = {
    US: 0x0ABE84,
    EU: 0x0AC7A4
}

Camera = {
    US: 0x0ABEB4,
    EU: 0x0AC7D4
}

MaxSpeed = {
    US: 0x0BABCC,
    EU: 0x0BB4EC
}

CurrentGear = {
    US: 0x0BB1FE,
    EU: 0x0BBB1E
}

CurrentBestLap = {
    US: 0x0BB2AC,
    EU: 0x0BBBCC
}

LapCount = {
    US: 0x0BB20C,
    EU: 0x0BBB2C
}

ChampionshipParams = [
    {
        "id": 0,
        "title": "Novice Cup",
        "name": "Novice Cup",
        "points": 5,
        "type": "",
    },
    {
        "id": 1,
        "title": "Spider Cup - GT2",
        "name": "Spider Cup - GT2",
        "points": 5,
        "type": "",
    },
    {
        "id": 2,
        "title": "Emperor Challenge",
        "name": "Emperor Challenge",
        "points": 5,
        "type": "",
    },
    {
        "id": 3,
        "title": "Seasons Cup",
        "name": "Seasons Cup",
        "points": 5,
        "type": "",
    },
    {
        "id": 4,
        "title": "Drivers Challenge - GT2",
        "name": "Drivers Challenge - GT2",
        "points": 5,
        "type": "",
    },
    {
        "id": 5,
        "title": "Orca Cup",
        "name": "Orca Cup",
        "points": 5,
        "type": "",
    },
    {
        "id": 6,
        "title": "Endurance Cup - GT2",
        "name": "Endurance Cup - GT2",
        "points": 5,
        "type": "",
    },
    {
        "id": 7,
        "title": "Ring Of Fire Cup - GT2",
        "name": "Ring Of Fire Cup - GT2",
        "points": 5,
        "type": "",
    },
    {
        "id": 8,
        "title": "Ultimatum Cup",
        "name": "Ultimatum Cup",
        "points": 5,
        "type": "",
    },
    {
        "id": 9,
        "title": "GT2 Champion",
        "name": "Invitational Cup - GT2",
        "points": 10,
        "type": "progression",
    },
    {
        "id": 10,
        "title": "Super Series",
        "name": "Super Series",
        "points": 10,
        "type": "",
    },
    {
        "id": 11,
        "title": "Spider Cup - GT1",
        "name": "Spider Cup - GT1",
        "points": 10,
        "type": "",
    },
    {
        "id": 12,
        "title": "Endurance Cup - GT1",
        "name": "Endurance Cup - GT1",
        "points": 10,
        "type": "",
    },
    {
        "id": 13,
        "title": "Ring Of Fire Cup - GT1",
        "name": "Ring Of Fire Cup - GT1",
        "points": 10,
        "type": "",
    },
    {
        "id": 14,
        "title": "BGS Challenge",
        "name": "BGS Challenge",
        "points": 10,
        "type": "",
    },
    {
        "id": 15,
        "title": "Drivers Challenge - GT1",
        "name": "Drivers Challenge - GT1",
        "points": 10,
        "type": "",
    },
    {
        "id": 16,
        "title": "Touring Cup",
        "name": "Touring Cup",
        "points": 10,
        "type": "",
    },
    {
        "id": 17,
        "title": "Grand Challenge",
        "name": "Grand Challenge",
        "points": 10,
        "type": "",
    },
    {
        "id": 18,
        "title": "World Champion",
        "name": "World Cup",
        "points": 10,
        "type": "",
    },
    {
        "id": 19,
        "title": "GT1 Champion",
        "name": "Invitational Cup - GT1",
        "points": 10,
        "type": "progression",
    },
]

PointThresholds = [
    10000,
    25000,
    50000,
    100000,
    150000,
    200000,
    250000,
    300000,
    350000,
    400000,
    450000,
    550000,
    650000,
    800000,
    1000000,
    1250000,
    1500000,
    1750000,
    2000000,
    2500000,
    3000000,
    3750000,
    4500000,
    5500000,
    6500000,
    7750000,
    9000000,
    1050000,
    1200000
]

// ACHIEVEMENTS
achievement(
    title = "Step by Step",
    points = 2,
    type = "progression",
    description = "Gain a rank",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        dword(IsOnResultScreen[region]) == 1 &&
        any_of(PointThresholds, target =>
            prev(dword(CurrentPoints[region])) < target &&
            dword(CurrentPoints[region]) >= target
        )
    )
    // using points instead of rank because the rank variable doesn't behave like I'd want it to
    // same for the "Number One" achievement
)

// returns the number of races in the current championship
function races_number(region){
    return dword(ChampData[region] + 92 + dword(CurrentChampionship[region])*112)
}

// returns true at the moment you complete a championship
function complete_championship(champ_number,region){
    return once(
            dword(Countdown[region]) == 0 &&
            prev(dword(Countdown[region])) == 1 &&
            dword(CurrentChampionship[region]) == champ_number &&
            dword(CurrentRace[region]) == 0
        ) &&
        never(dword(InfiniteRestarts[region]) == 1) &&
        never(dword(CurrentRace[region]) < prev(dword(CurrentRace[region]))) &&
        never(dword(CurrentChampionship[region]) != champ_number) &&
        dword(CurrentRace[region]) == (races_number(region) - 1) &&
        trigger_when(
            dword(ChampionshipFirstPlace[region]) == 0 &&
            prev(dword(ResultScreenPage[region])) == 5 &&
            dword(ResultScreenPage[region]) == 6
        )
}

for champ in ChampionshipParams{
    achievement(
        title = champ["title"],
        points = champ["points"],
        type = champ["type"],
        description = format("Complete {0} in 1st place", champ["name"]),
        trigger = any_of(Regions, region =>
            IsRegion(region) &&
            complete_championship(champ["id"],region)
        )
    )
}

achievement(
    title = "Getting Started",
    points = 1,
    description = "Complete a lap in Training mode",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        dword(CurrentGamemode[region]) == 7 &&
        trigger_when(
            prev(dword(LapCount[region])) == 0 &&
            dword(LapCount[region]) == 1
        )
    )
)

achievement(
    title = "Head Start",
    points = 5,
    description = "Qualify for a race in pole position",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        dword(CurrentGamemode[region]) == 1 &&
        dword(Winner[region]) == 0 &&
        prev(dword(ResultScreenPage[region])) == 1 &&
        dword(ResultScreenPage[region]) == 2
    )
)

achievement(
    title = "You're Winner!",
    points = 3,
    description = "Win an Arcade Race",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        dword(FirstPlaceId[region]) == 0 &&
        prev(dword(IsOnResultScreen[region])) == 0 &&
        dword(IsOnResultScreen[region]) == 1 &&
        dword(CurrentGamemode[region]) == 3
    )
)

// returns true if a race has been won using a car with an id between carmin and carmax
function win_in_car(carmin,carmax,region){
    return dword(CurrentGamemode[region]) >= 2 &&
        dword(CurrentGamemode[region]) <= 3 &&
        dword(CurrentCar[region]) >= carmin &&
        dword(CurrentCar[region]) <= carmax &&
        dword(FirstPlaceId[region]) == 0 &&
        prev(dword(IsOnResultScreen[region])) == 0 &&
        dword(IsOnResultScreen[region]) == 1
}

BrandParams = [
    {
        "brandname": "Speedcraft",
        "modelname": "Stallion SR",
        "firstcar": 6,
        "lastcar": 8,
        "points": 2,
    },
    {
        "brandname": "Kohr Racing",
        "modelname": "Rage 512 Evo",
        "firstcar": 0,
        "lastcar": 2,
        "points": 2,
    },
    {
        "brandname": "Viewpoint",
        "modelname": "Elan Swift TT",
        "firstcar": 9,
        "lastcar": 11,
        "points": 2,
    },
    {
        "brandname": "Reeds",
        "modelname": "Reeds R12 Manta",
        "firstcar": 3,
        "lastcar": 5,
        "points": 2,
    },
    {
        "brandname": "Eurospec",
        "modelname": "Ram Venom GTR",
        "firstcar": 14,
        "lastcar": 15,
        "points": 2,
    },
    {
        "brandname": "Totalsport",
        "modelname": "Furio LS",
        "firstcar": 12,
        "lastcar": 13,
        "points": 2,
    },
    {
        "brandname": "Elite",
        "modelname": "EXR Challenger",
        "firstcar": 16,
        "lastcar": 16,
        "points": 2,
    },
    {
        "brandname": "Team Nebo",
        "modelname": "Hayai N70",
        "firstcar": 17,
        "lastcar": 19,
        "points": 3,
    },
    {
        "brandname": "Victorysmith",
        "modelname": "Lance Scorcher GT",
        "firstcar": 20,
        "lastcar": 22,
        "points": 3,
    },
    {
        "brandname": "Sage Autosport",
        "modelname": "Elan Scorpion",
        "firstcar": 23,
        "lastcar": 25,
        "points": 3,
    },
    {
        "brandname": "Lassiter",
        "modelname": "McCloud F-Type",
        "firstcar": 26,
        "lastcar": 27,
        "points": 3,
    },
    {
        "brandname": "SSD Competition",
        "modelname": "Panzer Betraye GT",
        "firstcar": 28,
        "lastcar": 29,
        "points": 3,
    },
    {
        "brandname": "Boss Racing",
        "modelname": "Rage 996 GTR",
        "firstcar": 30,
        "lastcar": 31,
        "points": 3,
    },
    {
        "brandname": "Meiden-Krauss",
        "modelname": "M-K Phantom R",
        "firstcar": 32,
        "lastcar": 32,
        "points": 3,
    },
    {
        "brandname": "Excalibur LTD",
        "modelname": "EXR Mystic",
        "firstcar": 33,
        "lastcar": 33,
        "points": 3,
    },
]

for brand in BrandParams{
    achievement(
        title = format("{0} Fan",brand["brandname"]),
        points = brand["points"],
        description = format("Win a race using a {0}",brand["modelname"]),
        trigger = any_of(Regions, region =>
            IsRegion(region) &&
            win_in_car(brand["firstcar"],brand["lastcar"],region)
        )
    )
}

achievement(
    title = "Reeds Expert",
    points = 10,
    description = "Unlock the A class version of the Reeds R12 Manta and win a race with it",
    type = "missable",
    trigger = any_of(Regions, region =>
            IsRegion(region) &&
            win_in_car(5,5,region)
    )
)

achievement(
    title = "Speed, I Am Speed",
    points = 5,
    description = "Reach a speed of 200mph (321kph)",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        dword(WherePlayer[region]) == 1 &&
        prev(float(MaxSpeed[region])) < 89.41 &&
        float(MaxSpeed[region]) >= 89.41 &&
        dword(RaceFrameCounter[region]) > 100 // just cause MaxSpeed behaves funny at the start of the race
    )
)

achievement(
    title = "Number One",
    points = 50,
    description = "Reach Rank 1",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        prev(dword(CurrentPoints[region])) < 12000000 &&
        dword(CurrentPoints[region]) >= 12000000 &&
        dword(IsOnResultScreen[region]) == 1
    )
)

// returns 1 if the car passed in parameter is unlocked, 0 if it isn't
function is_car_unlocked(car,region){
    return byte(CarUnlocks[region] + car * 20)
}

// returns the number of cars unlocked
function cars_unlocked(region){
    n = 0
    for it in range(0,34){
        n = n + is_car_unlocked(it,region)
    }
    return n
}

achievement(
    title = "Collector",
    points = 25,
    description = "Unlock every car",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        cars_unlocked(region) == 35 &&
        prev(cars_unlocked(region)) == 34 &&
        dword(ResultScreenPage[region]) == 9 &&
        dword(CurrentGamemode[region]) < 17 &&
        dword(CurrentGamemode[region]) != 0
    )
)

achievement(
    title = "Perfectionist",
    points = 50,
    description = "Get 1st place in every championship",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        prev(dword(EventsWon[region])) == 19 &&
        dword(EventsWon[region]) == 20 &&
        dword(ResultScreenPage[region]) == 9
    )
)

achievement(
    title = "I Like Them Pink",
    points = 2,
    description = "Win a race with a pink car, which you can get by using the username \"IGN64\" in Championship mode",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        dword(SaveName[region]) == 1768386102 &&
        dword(SaveName[region] + 4) == 872415232 &&
        dword(SaveName[region] + 8) == 0 &&
        trigger_when(win_in_car(0,100,region))
    )
)

achievement(
    title = "Micromachines",
    points = 2,
    description = "Win a race with the Small Cars cheat on",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        once(
            prev(dword(SmallCars[region])) == 0 &&
            dword(SmallCars[region]) == 1 &&
            prev(dword(Countdown[region])) == 1 &&
            dword(CurrentGamemode[region]) >= 2 &&
            dword(CurrentGamemode[region]) <= 3
        ) &&
        never(dword(MenuMode[region]) >= 8) &&
        never(dword(BlurryMode[region]) != 0) &&
        trigger_when(win_in_car(0,100,region))
    )
)

achievement(
    title = "Ghostracer", points = 3,
    description = "Win a race with the Invisible Cars cheat on for the whole race",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        once(
            prev(dword(IsCarVisible[region])) == 1 &&
            dword(IsCarVisible[region]) == 0 &&
            prev(dword(Countdown[region])) == 1 &&
            dword(CurrentGamemode[region]) >= 2 &&
            dword(CurrentGamemode[region]) <= 3
        ) &&
        never(dword(MenuMode[region]) >= 8) &&
        never(dword(IsCarVisible[region]) == 1) &&
        trigger_when(win_in_car(0,100,region))
    )
)

achievement(
    title = "Gonna Need Some Glasses", points = 2,
    description = "Win a race with the Retro Graphics cheat on for the whole race",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        once(
           dword(BlurryMode[region]) == 0 &&
           dword(Countdown[region]) == 0 &&
           prev(dword(Countdown[region])) == 1 &&
           dword(CurrentGamemode[region]) >= 2 &&
           dword(CurrentGamemode[region]) <= 3
        ) &&
        never(dword(MenuMode[region]) >= 8) &&
        never(dword(BlurryMode[region]) != 0) &&
        trigger_when(win_in_car(0,100,region))
    )
)

achievement(
    title = "All Blacks",
    points = 2,
    description = "Win a race using a fully black car",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        once(
            prev(dword(BlackCars[region])) == 0 &&
            dword(BlackCars[region]) == 1 &&
            prev(dword(Countdown[region])) == 1 &&
            dword(CurrentGamemode[region]) >= 2 &&
            dword(CurrentGamemode[region]) <= 3
        ) &&
        never(dword(MenuMode[region]) >= 8) &&
        never(dword(BlurryMode[region]) != 0) &&
        trigger_when(win_in_car(0,100,region))
    )
)

achievement(
    title = "I Can See My House from There",
    points = 3,
    description = "Win a race with the Bird's Eye View cheat on for the whole race",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        once(
            dword(WherePlayer[region]) == 1 &&
            prev(dword(CameraVerticalAngle[region])) < 3247439872 &&
            dword(CameraVerticalAngle[region]) >= 3247439872 &&
            dword(IsOnResultScreen[region]) == 0 &&
            dword(Camera[region]) != 7
        ) &&
        never(dword(MenuMode[region]) >= 8) &&
        never(dword(CameraVerticalAngle[region]) < 3247439872) &&
        trigger_when(win_in_car(0,100,region))
    )
)

achievement(
    title = "The Duel", points = 5,
    description = "Beat and unlock the Falcon Interceptor",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        prev(is_car_unlocked(0x22,region)) == 0 &&
        is_car_unlocked(0x22,region) == 1 &&
        dword(ResultScreenPage[region]) == 9
    )
)

achievement(
    title = "Toyota Prius", points = 5,
    description = "Win a race with manual gearbox using only the 1st gear",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        once((prev(word(CurrentGear[region]))==65535) && word(CurrentGear[region])==0) &&
        dword(FirstPlaceId[region]) == 0 &&
        prev(dword(IsOnResultScreen[region])) == 0 &&
        dword(IsOnResultScreen[region]) == 1 &&
        dword(CurrentGamemode[region]) >= 2 &&
        dword(CurrentGamemode[region]) <= 3 &&
        never((prev(word(CurrentGear[region])>=1)) && (prev(word(CurrentGear[region])!=65535)))
    )
)

function no_qual(region){
    return never(dword(CurrentGamemode[region]) == 1) &&
        never(dword(CurrentRace[region]) < prev(dword(CurrentRace[region]))) &&
        never(dword(RestartCredits[region]) < prev(dword(RestartCredits[region]))) &&
        complete_championship(dword(CurrentChampionship[region]),region)
}

achievement(
    title = "Fast Learner",
    points = 10,
    description = "Win a tournament comprised of 3 races or more without doing any qualifying laps and without using any restart credits",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        dword(CurrentChampionship[region]) > 1 &&
        dword(CurrentChampionship[region]) != 9 &&
        dword(CurrentChampionship[region]) != 19 &&
        no_qual(region)
    )
)

achievement(
    title = "Clean Sweep", points = 25,
    description = "Win every race in a 6 race tournament, without using any restart credits",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        complete_championship(dword(CurrentChampionship[region]),region) &&
        never(dword(RestartCredits[region]) < prev(dword(RestartCredits[region]))) &&
        dword(CurrentChampionshipPoints[region]) == 90
    )
)

achievement(
    title = "The Underdog",
    points = 10,
    description = "Finish 1st in any GT1 championship using a GT2 car, without using any restart credits",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        complete_championship(dword(CurrentChampionship[region]),region) &&
        never(dword(RestartCredits[region]) < prev(dword(RestartCredits[region]))) &&
        dword(CurrentCar[region]) <= 16 &&
        dword(CurrentChampionship[region]) >= 10
    )
)

GT2 = [
    0,
    3,
    6,
    9
]

/*GT1 = [
    17,
    20,
    23
]*/

achievement(
    title = "GT2 Master",
    points = 25,
    description = "Beat the GT2 Invitational Cup with a C class GT2 car",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        any_of(GT2, car => dword(CurrentCar[region]) == car) &&
        complete_championship(9,region)
    )
)

/*deleted achievement (too difficult and not for the right reasons)
achievement(
    title = "GT1 Master",
    points = 25,
    description = "Beat the GT1 Invitational Cup with a C class GT1 car",
    trigger = any_of(Regions, region =>
        IsRegion(region) &&
        any_of(GT1, car => dword(CurrentCar[region]) == car) &&
        complete_championship(19,region)
    )
)*/

// returns true if the time trial requirements passed in parameter are met
function time_trial_req(track,time_goal,region){
    return dword(WherePlayer[region]) == 1 &&
        dword(CurrentTrack[region]) == track &&
        trigger_when(
            float(CurrentBestLap[region]) <= time_goal &&
            float(CurrentBestLap[region]) > (0.5 * time_goal) &&
            dword(LapCount[region]) > prev(dword(LapCount[region]))
        )
}

TimeTrials = [
    {
        "title": "GT2 Hotlapper",
        "description": "Beat a laptime of 1:54 on Lisbon BR using a GT2 car",
        "track": 28,
        "timereq": 114.0,
        "carmin": 0,
        "carmax": 17,
    },
    {
        "title": "GT1 Hotlapper",
        "description": "Beat a laptime of 1:23 on Kyoto CR (EXR Mystic and Falcon Interceptor not allowed)",
        "track": 53,
        "timereq": 83.0,
        "carmin": 0,
        "carmax": 33,
    },
    {
        "title": "Las Vegas CR Time Trial",
        "description": "Beat a laptime of 1:20 on Las Vegas CR",
        "track": 17,
        "timereq": 80.0,
        "carmin": 0,
        "carmax": 35,
    },
    {
        "title": "Sydney CR Time Trial",
        "description": "Beat a laptime of 1:18 on Sydney CR",
        "track": 41,
        "timereq": 78.0,
        "carmin": 0,
        "carmax": 35,
    },
    {
        "title": "Kyoto AR Time Trial",
        "description": "Beat a laptime of 0:45 on Kyoto AR",
        "track": 51,
        "timereq": 45.0,
        "carmin": 0,
        "carmax": 35,
    },
    {
        "title": "New Zealand A Time Trial",
        "description": "Beat a laptime of 1:10 on New Zealand A",
        "track": 18,
        "timereq": 70.0,
        "carmin": 0,
        "carmax": 35,
    },
    {
        "title": "Zurich B Time Trial",
        "description": "Beat a laptime of 1:40 on Zurich B",
        "track": 43,
        "timereq": 100.0,
        "carmin": 0,
        "carmax": 35,
    },
    {
        "title": "Black Forest B Time Trial",
        "description": "Beat a laptime of 1:15 on Black Forest B",
        "track": 55,
        "timereq": 75.0,
        "carmin": 0,
        "carmax": 35,
    },
    {
        "title": "Hawaii C Time Trial",
        "description": "Beat a laptime of 1:09 on Hawaii C",
        "track": 2,
        "timereq": 69.0,
        "carmin": 0,
        "carmax": 35,
    },
    {
        "title": "Rome A Time Trial",
        "description": "Beat a laptime of 1:14 on Rome A",
        "track": 30,
        "timereq": 74.0,
        "carmin": 0,
        "carmax": 35,
    },
    {
        "title": "Les Gets A Time Trial",
        "description": "Beat a laptime of 1:27 on Les Gets A",
        "track": 6,
        "timereq": 87.0,
        "carmin": 0,
        "carmax": 35,
    }
]

for tt in TimeTrials{
    achievement(
        title = tt["title"],
        points = 10,
        description = tt["description"],
        trigger = any_of(Regions, region =>
            IsRegion(region) &&
            time_trial_req(tt["track"],tt["timereq"],region) &&
            dword(CurrentCar[region]) >= tt["carmin"] &&
            dword(CurrentCar[region]) <= tt["carmax"]
        )
    )
}

// LEADERBOARDS

TrackLookup = {
    0x00: "Hawaii A",
    0x01: "Hawaii B",
    0x02: "Hawaii C",
    0x03: "Hawaii AR",
    0x04: "Hawaii BR",
    0x05: "Hawaii CR",
    0x06: "Les Gets A",
    0x07: "Les Gets B",
    0x08: "Les Gets C",
    0x09: "Les Gets AR",
    0x0a: "Les Gets BR",
    0x0b: "Les Gets CR",
    0x0c: "Las Vegas A",
    0x0d: "Las Vegas B",
    0x0e: "Las Vegas C",
    0x0f: "Las Vegas AR",
    0x10: "Las Vegas BR",
    0x11: "Las Vegas CR",
    0x12: "New Zealand A",
    0x13: "New Zealand B",
    0x14: "New Zealand C",
    0x15: "New Zealand AR",
    0x16: "New Zealand BR",
    0x17: "New Zealand CR",
    0x18: "Lisbon A",
    0x19: "Lisbon B",
    0x1a: "Lisbon C",
    0x1b: "Lisbon AR",
    0x1c: "Lisbon BR",
    0x1d: "Lisbon CR",
    0x1e: "Rome A",
    0x1f: "Rome B",
    0x20: "Rome C",
    0x21: "Rome AR",
    0x22: "Rome BR",
    0x23: "Rome CR",
    0x24: "Sydney A",
    0x25: "Sydney B",
    0x26: "Sydney C",
    0x27: "Sydney AR",
    0x28: "Sydney BR",
    0x29: "Sydney CR",
    0x2a: "Zurich A",
    0x2b: "Zurich B",
    0x2c: "Zurich C",
    0x2d: "Zurich AR",
    0x2e: "Zurich BR",
    0x2f: "Zurich CR",
    0x30: "Kyoto A",
    0x31: "Kyoto B",
    0x32: "Kyoto C",
    0x33: "Kyoto AR",
    0x34: "Kyoto BR",
    0x35: "Kyoto CR",
    0x36: "Black Forest A",
    0x37: "Black Forest B",
    0x38: "Black Forest AR",
    0x39: "Black Forest BR",
}

function StartLap(track){
    return any_of(Regions, region =>
            IsRegion(region) &&
            dword(CurrentTrack[region]) == track &&
            dword(WherePlayer[region]) == 1 &&
            dword(CurrentGamemode[region]) != 7 &&
            dword(CurrentGamemode[region]) != 9 &&
            prev(dword(LapCount[region])) < dword(LapCount[region]) &&
            float(CurrentBestLap[region]) > 20.0 && 
            float(CurrentBestLap[region]) != prev(float(CurrentBestLap[region]))
        )
}

function SubmitLap(track){
    return always_true()
}

function CancelLap(){
    return always_false()
}

for index in TrackLookup{
    leaderboard(
        TrackLookup[index] + " Best Lap",
        "Fastest Lap on " + TrackLookup[index],
        StartLap(index),
        CancelLap(),
        SubmitLap(index),
        value = max_of(
            measured(100*float(CurrentBestLap[US]), when=(IsRegionLB(US))),
            measured(100*float(CurrentBestLap[EU]), when=(IsRegionLB(EU)))
        ),
        format = "MILLISECS",
        lower_is_better = true
    )
}

//
