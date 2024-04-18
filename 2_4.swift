## 2.4 Parameters

### 2.4.1 Moving further forward


```Swift
// 2.4.1
// v- 0

let expert = Expert()
func move(distance: Int) {
	for i in 1...distance {
		expert.moveForward()
		}
}

var gem = 0

while gem < 1 {
    move(distance: 6)
    expert.turnRight()
    move(distance: 2)
    expert.turnRight()
    move(distance: 5)
    expert.turnLeft()
    move(distance: 5)
    expert.turnLeft()
    expert.turnLockUp()
    expert.turnLeft()
    move(distance: 3)
    expert.turnRight()
    move(distance: 3)
    expert.turnRight()
    move(distance: 4)
    expert.collectGem()
    gem += 1
    
}


////////////////////////////////

```


```Swift
// 2.4.1 
// v- 1 Hej!


let c1 = Character()
world.place(c1, atColumn: 4, row: 0)
c1.collectGem()


////////////////////////////////

```

### 2.4.2 Generalizing a function

```Swift
// 2.4.2 
// v- 0

let expert = Expert()
let character = Character()

func turnLockUp(up: Bool, numberOfTimes: Int) {
	for i in 1...numberOfTimes{
        if up == true{
            expert.turnLockUp()
        } else if up == false{
            expert.turnLockDown()
        }
        
    }
}


func doubleLeft(){
    (1...2).forEach {_ in expert.turnLeft()}
}

func MCTlTlM(){
    character.moveForward()
    character.collectGem()
    (1...2).forEach {_ in character.turnLeft()}
    character.moveForward()
}

func MTr(){
    character.moveForward()
    character.turnRight()
}

func TrM(){
    character.turnRight()
    character.moveForward()
}

doubleLeft()
turnLock(up: true, numberOfTimes: 3)
MTr()
turnLock(up: false, numberOfTimes: 3)
MTr()
MCTlTlM()
character.moveForward()
doubleLeft()
turnLock(up: true, numberOfTimes: 1)
MCTlTlM()
TrM()
turnLock(up: true, numberOfTimes: 2)
TrM()
character.collectGem()



////////////////////////////////

```


```Swift
// 2.4.2 
// v- 1

let expert = Expert()
let character = Character()

func turnLock(up: Bool, numberOfTimes: Int) {
	for i in 1...numberOfTimes {
       up ? expert.turnLockUp() : expert.turnLockDown()
    }

}




func Do(_ fun: () -> Void, _ times: Int) {
    for _ in 1...times {
        fun()
    }
}


func collGem(){
    character.moveForward()
    character.collectGem()
   Do(character.turnLeft, 2 )  
}

func TurnLock(_ up: Bool, _ times: Int){
    for i in 1...times {
           up ? expert.turnLockUp() : expert.turnLockDown()
        }

}

func patternedMove(){
        (1...2).forEach {_ in 
        character.moveForward()
        character.turnRight()}
}




turnLock(true,  1)
Do(expert.turnLeft, 2 )  
turnLock(true,  3)
patternedMove()
turnLock( false,  3)
collGem()
character.moveForward()
turnLock(true, 1)
character.moveForward()
collGem()
patternedMove()
Do(expert.turnLeft, 2 ) 
turnLock( true,  2)
collGem()



////////////////////////////////

```


```Swift
// 2.4.2 
// v- 2

func turnLockUp(up: Bool, numberOfTimes: Int) {
	for i in 1...numberOfTimes{
        if up == true{
            expert.turnLockUp()
        } else if up == false{
            expert.turnLockDown()
        }
        
    }
}


func aboutFace(obj: Any) {
    if let expert = obj as? Expert {
        expert.turnLeft(); expert.turnLeft()
    } else if let character = obj as? Character {
        character.turnLeft(); character.turnLeft()
    }
}


func clearLast(){
    character.moveForward()
    character.moveForward()
    character.collectGem()
}

turnLock(up: true, numberOfTimes: 3)
aboutFace(obj: expert)
turnLock(up: true, numberOfTimes: 3)
clearLast()
 character.moveForward()
character.collectGem()
aboutFace(obj: character)
character.moveForward()
turnLock(up: false, numberOfTimes: 2)
aboutFace(obj: expert)
turnLock(up: false, numberOfTimes: 2)
character.turnLeft()
character.moveForward()
character.turnLeft()
character.moveForward()
aboutFace(obj: character)
character.collectGem()
clearLast()
aboutFace(obj: expert)
turnLock(up: false, numberOfTimes: 1)
character.moveForward()
character.collectGem()




////////////////////////////////

```

### 2.4.3 Crank up and down

```Swift
// 2.4.3 
// v- 0

let expert = Expert()
let character = Character()

var gems = 0

func exDown3Trr(){
    expert.turnLock(up: false, numberOfTimes: 3)
    expert.turnRight()
}

func chTa(){
    character.turnLeft()
    character.turnLeft()
}

func chTllMf(){
    character.turnLeft()
    character.moveForward()
}

func ColnCount(){
    if character.isOnGem{
        character.collectGem()
        gems += 1
    }
}

expert.turnLock(up: true, numberOfTimes: 4)

func generalMove(){
    character.moveForward()
    ColnCount()
    
    if character.isBlocked{
        
        if !character.isBlockedRight{
            character.turnRight()
        }
        else if !character.isBlockedLeft{
            character.turnLeft()
        }
    }; 
    
    if character.isBlocked && character.isBlockedLeft && character.isBlockedRight{
        chTa()
        
    }
}

expert.turnLeft()
expert.turnLock(up: true, numberOfTimes: 4)

while gems < 3 {
    generalMove()
}
chTa()
character.moveForward()
exDown3Trr()
exDown3Trr()
expert.turnLock(up: true, numberOfTimes: 1)
expert.turnRight()
expert.turnLock(up: true, numberOfTimes: 1)



chTllMf()
chTllMf()

while gems < 7 {
    character.moveForward()
    ColnCount()
    if !character.isBlockedRight{
        character.turnRight()
    }
    
    if character.isBlocked{
        chTa()
    }
}

////////////////////////////////

```


```Swift
// 2.4.3 
// v- 1

let expert = Expert()
let character = Character()

func turnLock(_ dir: Bool, _ times: Int) {
    for _ in 1...times {
        dir ? expert.turnLockUp() : expert.turnLockDown()
    }
}



func chMfTaCol(){
    character.moveForward()
    character.turnLeft()
    character.turnLeft()
    character.collectGem()
}

func chColTrr(){
    character.collectGem()
    character.turnRight()
}

func exTllLockDown(){
    expert.turnLeft()
    turnLock(false, 3)
}

func exTrrLockUp(){
    expert.turnRight()
    turnLock(true, 4)
}

func chTrrMf(){
    character.turnRight()
    character.moveForward()
}

for k in 1...21 {
    character.moveForward()   
    switch (k){
    case 2:
        chColTrr()       
        turnLock(true, 4)
    case 4: 
        chColTrr()  
        exTrrLockUp()
        exTrrLockUp()
    case 8:
        chColTrr()  
        exTrrLockUp()
    case 9:
        character.turnLeft()
        turnLock(false, 3)
        chMfTaCol()
        exTllLockDown()
    case 11:
        chTrrMf()
        chMfTaCol()
    case 13:
        character.turnRight()
        exTllLockDown()
        
    case 15:
        chTrrMf()
        chMfTaCol()
        exTllLockDown()
        
    case 18:
        chTrrMf()
        chMfTaCol()

    default:
        break
}
    
    
}


////////////////////////////////

```

### 2.4.4 Placing at a specific location

```Swift
// 2.4.4 
// v- 0

func pattern(){
    ex.turnLeft()
    ex.moveForward()
    ex.turnLockUp()
    ex.turnRight()
}


let ex = Expert()

world.place(ex, atColumn: 1, row: 6)

ex.collectGem()
pattern()

for i in 1...5 {
    ex.moveForward()
}

ex.turnRight()
ex.moveForward()
ex.collectGem()
ex.turnLeft()
pattern()

for i in 1...6 {
    ex.moveForward()
}

ex.collectGem()



////////////////////////////////

```


```Swift
// 2.4.4
// v- 1


let ex = Expert()
let ch = Character()
let ch2 = Character()

world.place(ch2, atColumn: 1, row: 1)
world.place(ex, atColumn: 2, row: 6)
world.place(ch, atColumn: 1, row: 6)
ex.turnLeft()
ex.turnLockUp()
ex.turnRight()
ch2.collectGem()
ch.collectGem()

for k in 1...5{
    ex.moveForward()
}
ex.turnLeft()
ex.turnLockUp()


ch.turnLeft()
ch.moveForward()
ch.turnRight()

var gems = 0
while gems < 1 {
    ch.moveForward()
    if ch.isOnGem {
        ch.collectGem()
        gems += 1
    }
}







////////////////////////////////

```


```Swift
// 2.4.4 
// v- 2


for i in 0..<3 {
    let w = Character()
    world.place(w, atColumn: [1, 1, 6][i], row: [6, 1, 1][i])
    w.collectGem()
}





[(1, 6), (1, 1), (6, 1)].map { c, r in
    let w = Character()
    world.place(w, atColumn: c, row: r)
    w.collectGem()
}

[(1, 6), (1, 1), (6, 1)].map {
    let w = Character()
    world.place(w, atColumn: $0.0, row: $0.1)
    w.collectGem()
}



////////////////////////////////

```

### 2.4.5 Rivers to cross

```Swift
// 2.4.5 
// v- 0

let ex = Expert()
world.place(ex, facing: .south, atColumn: 1, row: 8)
var steps = 0
while steps < 12 {
    ex.collectGem()
    ex.moveForward()
    steps += 1
    if  steps == 3 {
        ex.turnLockDown()
        ex.turnLeft()
    }   else if steps == 7{
        ex.turnLockUp()
        ex.turnRight()
    }
}

func pattern(_ n: Int){
    for i in 1...n{
        if ex.isOnGem{
            ex.collectGem()
        }
         ex.moveForward()
    }
}
pattern(4)
ex.turnLockDown()
ex.turnLeft()
pattern(4)
ex.turnLockUp()
ex.turnRight()
pattern(5)

////////////////////////////////

```


```Swift
// 2.4.5 
// v- 1

let c1 = Character()
world.place(c1, facing: .south, atColumn: 1, row: 8)


for k in 1...4{
    c1.collectGem()
    c1.moveForward()
}

let x2 = Expert()
world.place(x2, facing: .east, atColumn: 4, row: 5)

while !x2.isBlocked{
     x2.collectGem()
    x2.moveForward()
   
    if x2.isBlocked && x2.isBlockedLeft{
        x2.turnLock(up: true, numberOfTimes: 1)
        x2.turnRight()
    }
}



////////////////////////////////

```


```Swift
// 2.4.5 
// v- 2

let c1 = Character()
world.place(c1, facing: .south, atColumn: 1, row: 8)


for k in 1...4{
    c1.collectGem()
    c1.moveForward()
}

let x2 = Expert()
world.place(x2, facing: .east, atColumn: 4, row: 5)

while !x2.isBlocked{
     x2.collectGem()
    x2.moveForward()
   
    if x2.isBlocked && x2.isBlockedLeft{
        x2.turnLock(up: true, numberOfTimes: 1)
        x2.turnRight()
    }
}



////////////////////////////////

```


```Swift
// 2.4.5
// v- 3

let x1 = Expert()
world.place(x1, facing: .south, atColumn: 1, row: 8)

while !x1.isBlocked{
     x1.collectGem()
    x1.moveForward()
   
    if x1.isBlocked && x1.isBlockedRight{
        x1.turnLock(up: false, numberOfTimes: 1)
        x1.turnLeft()
    }
    
    if x1.isBlocked && x1.isBlockedLeft{
           x1.turnLock(up: true, numberOfTimes: 1)
           x1.turnRight()
       }
}


////////////////////////////////

```


```Swift
// 2.4.5 
// v- 4

let x1 = Expert()
world.place(x1, facing: .south, atColumn: 1, row: 8)

while !x1.isBlocked {
     x1.collectGem()
     x1.moveForward()
   
    switch (x1.isBlocked, x1.isBlockedLeft, x1.isBlockedRight) {
    case (true, false, true):
        x1.turnLock(up: false, numberOfTimes: 1)
        x1.turnLeft()
    case (true, true, false):
        x1.turnLock(up: true, numberOfTimes: 1)
        x1.turnRight()
    default:
        break
    }
}


func work(_ times: Int){
    for k in 1...times{
        w1.collectGem()
        w1.moveForward()
    }
}

let w1 = Character()
world.place(w1, facing: .south, atColumn: 1, row: 8)
work(4)
world.place(w1, facing: .south, atColumn: 5, row: 4)
work(1)
world.place(w1, facing: .east, atColumn: 4, row: 5)
work(2)
world.place(w1, facing: .north, atColumn: 5, row: 1)
work(2)


let w1 = Character()
world.place(w1, facing: .south, atColumn: 1, row: 8)
world.place(w1, facing: .south, atColumn: 5, row: 4)
world.place(w1, facing: .east, atColumn: 4, row: 5)
world.place(w1, facing: .east, atColumn: 4, row: 5)
world.place(w1, facing: .north, atColumn: 5, row: 1)



////////////////////////////////

```


```Swift
// 2.4.5 
// v- 5 Hej!


func work(_ times: Int){
    for _ in 1...times{
        w1.collectGem()
        w1.moveForward()
    }
}

let w1 = Character()
let data: [(Direction, Int, Int, Int)] = [
    (.south, 1, 8, 4), 
    (.south, 5, 4, 1), 
    (.east, 4, 5, 2), 
    (.north, 5, 1, 2)
]

data.forEach { 
    world.place(w1, facing: $0.0, atColumn: $0.1, row: $0.2) 
    work($0.3)
}


////////////////////////////////

```

### 2.4.6 Rivers to cross

```Swift
// 2.4.6 
// v- 0

let ex = Expert()
world.place(ex, facing: .south, atColumn: 1, row: 8)
var steps = 0
while steps < 12 {
    ex.collectGem()
    ex.moveForward()
    steps += 1
    if  steps == 3 {
        ex.turnLockDown()
        ex.turnLeft()
    }   else if steps == 7{
        ex.turnLockUp()
        ex.turnRight()
    }
}


//
func pattern(_ n: Int){
    for i in 1...n{
        if ex.isOnGem{
            ex.collectGem()
        }
         ex.moveForward()
    }
}
pattern(4)
ex.turnLockDown()
ex.turnLeft()
pattern(4)
ex.turnLockUp()
ex.turnRight()
pattern(5)



////////////////////////////////

```


```Swift
// 2.4.6
// v- 1

let c1 = Character()
world.place(c1, facing: .south, atColumn: 1, row: 8)


for k in 1...4{
    c1.collectGem()
    c1.moveForward()
}

let x2 = Expert()
world.place(x2, facing: .east, atColumn: 4, row: 5)

while !x2.isBlocked{
     x2.collectGem()
    x2.moveForward()
   
    if x2.isBlocked && x2.isBlockedLeft{
        x2.turnLock(up: true, numberOfTimes: 1)
        x2.turnRight()
    }
}



////////////////////////////////

```


```Swift
// 2.4.6 
// v- 2

let x1 = Expert()
world.place(x1, facing: .south, atColumn: 1, row: 8)

while !x1.isBlocked{
     x1.collectGem()
    x1.moveForward()
   
    if x1.isBlocked && x1.isBlockedRight{
        x1.turnLock(up: false, numberOfTimes: 1)
        x1.turnLeft()
    }
    
    if x1.isBlocked && x1.isBlockedLeft{
           x1.turnLock(up: true, numberOfTimes: 1)
           x1.turnRight()
       }
}


////////////////////////////////

```


```Swift
// 2.4.6 
// v- 3

let x1 = Expert()
world.place(x1, facing: .south, atColumn: 1, row: 8)

while !x1.isBlocked {
     x1.collectGem()
     x1.moveForward()
   
    switch (x1.isBlocked, x1.isBlockedLeft, x1.isBlockedRight) {
    case (true, false, true):
        // x1 is blocked by a wall on the right
        x1.turnLock(up: false, numberOfTimes: 1)
        x1.turnLeft()
    case (true, true, false):
        // x1 is blocked by a wall on the left
        x1.turnLock(up: true, numberOfTimes: 1)
        x1.turnRight()
    default:
        // x1 is not blocked or blocked by walls on both sides
        break
    }
}


func work(_ times: Int){
    for k in 1...times{
        w1.collectGem()
        w1.moveForward()
    }
}

let w1 = Character()
world.place(w1, facing: .south, atColumn: 1, row: 8)
work(4)
world.place(w1, facing: .south, atColumn: 5, row: 4)
work(1)
world.place(w1, facing: .east, atColumn: 4, row: 5)
work(2)
world.place(w1, facing: .north, atColumn: 5, row: 1)
work(2)


let w1 = Character()
world.place(w1, facing: .south, atColumn: 1, row: 8)
world.place(w1, facing: .south, atColumn: 5, row: 4)
world.place(w1, facing: .east, atColumn: 4, row: 5)
world.place(w1, facing: .east, atColumn: 4, row: 5)
world.place(w1, facing: .north, atColumn: 5, row: 1)



////////////////////////////////

```


```Swift
// 2.4.6 
// v- 4 Hej!

func work(_ times: Int){
    for _ in 1...times{
        w1.collectGem()
        w1.moveForward()
    }
}

let w1 = Character()
let data: [(Direction, Int, Int, Int)] = [
    (.south, 1, 8, 4), 
    (.south, 5, 4, 1), 
    (.east, 4, 5, 2), 
    (.north, 5, 1, 2)
]

data.forEach { 
    world.place(w1, facing: $0.0, atColumn: $0.1, row: $0.2) 
    work($0.3)
}



////////////////////////////////

```
### 2.4.7 Placing two characters

```Swift
// 2.4.7 
// v- 0

let (ch, ex) = (Character(),Expert())

world.place(ch, facing: .north, atColumn: 0, row: 0)
world.place(ex, facing: .north, atColumn: 3, row: 0)

ex.toggleSwitch()
ex.turnLockUp()

func pattern(_ times: Int) {
    for k in 1...times {
       
        if ch.isOnGem { ch.collectGem() }
        if ch.isBlocked { ch.jump() }
    }
}


pattern(4)
ch.turnRight()
pattern(4)
ch.turnLeft()
ch.moveForward()
ch.moveForward()
ch.collectGem()


////////////////////////////////

```


```Swift
// 2.4.7 
// v- 1 Hej!

let positions = [(0, 0), (0, 2), (0, 4), (2, 4),(3, 0), (4, 6), (4, 4)]

for i in 0..<7 {
    let c = Character()
    world.place(c, atColumn: positions[i].0, row: positions[i].1)
    c.collectGem()
    if c.isOnClosedSwitch{
        c.toggleSwitch()
    }
}



////////////////////////////////

```

### 2.4.8 Two experts

```Swift
// 2.4.8 
// v- 0

let Pesh = Expert()
let War = Expert()
var steps = 0



world.place(Pesh, atColumn: 0, row: 4)
world.place(War, atColumn: 6, row: 0)


War.turnLeft()
War.turnLock(up: false, numberOfTimes: 2)
Pesh.turnLeft()
Pesh.turnLeft()
Pesh.turnLockDown()

War.turnLeft()
War.turnLeft()
War.move(distance: 3)
War.turnRight()
War.turnLock(up: true, numberOfTimes: 2)

Pesh.turnLockUp()

    War.turnLeft()
War.move(distance: 3)
War.collectGem()
War.turnLeft()
War.turnLeft()
War.move(distance: 2)
Pesh.turnLockDown()
War.move(distance: 4)



Pesh.turnRight()

func CheckTile(){
    
    if Pesh.isOnGem{
        Pesh.collectGem()
    }
    Pesh.moveForward()
    steps += 1
    
    if Pesh.isBlocked && Pesh.isBlockedLeft && Pesh.isBlockedRight{
        Pesh.turnLeft()
        Pesh.turnLeft()
    }
    
    if Pesh.isBlocked && Pesh.isBlockedLeft && !Pesh.isBlockedRight{
        Pesh.turnRight()
    }
    
}



while steps < 11 {
    if steps == 4 {
        War.turnLockUp()
    }
    if steps == 9{
        Pesh.turnLeft()
        Pesh.moveForward()
        Pesh.turnRight()
        Pesh.moveForward()
    }
    CheckTile()
}






////////////////////////////////

```


```Swift
// 2.4.8 
// v- 1

let (e1, e2, e3, e4) = (Expert(),Expert(),Expert(),Expert())
world.place(e1, facing:.east, atColumn: 0 , row: 4)
world.place(e2, facing:.east, atColumn: 0 , row: 0)
world.place(e3, facing:.north, atColumn: 3 , row: 0)
world.place(e4, facing:.east, atColumn: 6 , row: 0)

e4.turnLock(up: false, numberOfTimes: 2)
e3.turnLock(up: true, numberOfTimes: 2)
e2.collectGem()

for k in 1...7{
    e1.moveForward()
    if e1.isOnGem{
        e1.collectGem()
    }
}



////////////////////////////////

```


```Swift
// 2.4.8 
// v- 2


let experts = (1...4).map { _ in Expert() }
let positions = [(0, 4), (0, 0), (3, 0), (6, 0)]
let directions: [Direction] = [.east, .east, .north, .east]

for (index, expert) in experts.enumerated() {
    world.place(expert, facing: directions[index], atColumn: positions[index].0, row: positions[index].1)
}

experts[3].turnLock(up: false, numberOfTimes: 2)
experts[2].turnLock(up: true, numberOfTimes: 2)
experts[1].collectGem()

for _ in 1...7 {
    experts[0].moveForward()
    if experts[0].isOnGem {
        experts[0].collectGem()
    }
}


////////////////////////////////

```


```Swift
// 2.4.8 
// v- 3

let (e1, e2) = (Expert(),Expert())
world.place(e1, facing:.north, atColumn: 0 , row: 4)
world.place(e2, facing:.east, atColumn: 0 , row: 0)

func e2moves(){
    for k in 1...3{
        e2.moveForward()
    }
}

e2.collectGem()
e2moves()
for k in 1...6{
    if k == 3 {
        e2.turnLeft()
        e2.turnLock(up: true, numberOfTimes: 2)
    }
}

e1.turnLock(up: false, numberOfTimes: 1)
e1.turnRight()

e2.turnRight()
e2moves()

e2.turnLock(up: false, numberOfTimes: 2)

for j in 1...7{
    e1.moveForward()
    if e1.isOnGem{
        e1.collectGem()
    }
}


////////////////////////////////

```


```Swift
// 2.4.8 
// v- 4

let experts = (0...7).map { _ in Expert() }
let positions = (0...7).map { ($0, 4) }

zip(experts, positions).forEach { expert, position in
    world.place(expert, atColumn: position.0, row: position.1)
    expert.collectGem()
}

let ch = Character()
world.place(ch, atColumn: 0, row: 0)
ch.collectGem()



////////////////////////////////

```


```Swift
// 2.4.8 
// v- 5 Hej!

let experts = (0...7).map { _ in Expert() } + [Expert()]
let positions = (0...7).map { ($0, 4) } + [(0, 0)]

zip(experts, positions).forEach { expert, position in
    world.place(expert, atColumn: position.0, row: position.1)
    expert.collectGem()
}



////////////////////////////////

```

### 2.4.9 Twin peaks

```Swift
// 2.4.9 
// v- 0

let totalGems = randomNumberOfGems


func ColCountgem(){
    ch.collectGem() || gh.collectGem() || ph.collectGem()
    gems += 1
}
let ch = Character(), gh = Character(), ph = Character()
world.place(ch, facing: .north, atColumn: 3, row: 0 )
world.place(gh, facing: .north, atColumn: 2, row: 0 )
world.place(ph, facing: .north, atColumn: 4, row: 0 )
var gems = 0
while gems < totalGems{
    if ch.isOnGem || gh.isOnGem || ph.isOnGem {
        ColCountgem()
    }; ch.moveForward(); gh.jump(); ph.jump()
    if ch.isBlocked{
        ch.turnLeft(); ch.turnLeft() // turns around
        gh.turnLeft(); gh.turnLeft()
        ph.turnLeft(); ph.turnLeft()
    }
}




////////////////////////////////

```


```Swift
// 2.4.9 
// v- 1

let totalGems = randomNumberOfGems
let expert = Expert()
let character = Character()
var gemCount = 0
func moveLong() {
    for i in 1...6 {
        if character.isOnGem {
            character.collectGem()
            gemCount += 1
        }
        character.jump()
    }
}
func moveShort() {
    for i in 1...2 {
        if character.isOnGem {
            character.collectGem()
            gemCount += 1
        }
        character.jump()
    }
}
world.place (expert, facing: north, atColumn:1, row:4)
world.place (character, facing: north, atColumn:3, row:0)
expert.turnLock(up:true, numberOfTimes:2)
while gemCount < totalGems {
    moveLong()
    character.turnRight()
    moveShort()
    character.turnRight()
}




////////////////////////////////

```


```Swift
// 2.4.9 
// v- 2

let totalGems = randomNumberOfGems

let columns = [2, 3, 4]
let rows = Array(0...6)


for column in columns {
    for row in rows {
        let ch = Character()
        world.place(ch, atColumn: column, row: row)
        if ch.isOnGem {
            ch.collectGem()
        }
    }
}


let columns = [2, 3, 4]
let rows = Array(0...6)
var gems = 0

let ch = Character()

while gems < totalGems {
    for column in columns {
        for row in rows {
            world.place(ch, facing: .north, atColumn: column, row: row)
            if  ch.isOnGem {
                ch.collectGem()
                gems += 1
            }
        }
    }
}

////////////////////////////////

```


```Swift
// 2.4.9 
// v- 3


let totalGems = randomNumberOfGems

let ex = Expert()
world.place(ex, facing:.north, atColumn: 0, row: 4)


let blu = Character()
world.place(blu, facing:.north, atColumn: 2, row: 0)

func work(){
    if blu.isOnGem{
        blu.collectGem()
    }
}


func clear(times: Int){
    for j in 1...times{
            blu.jump()
        work()
    }
}

blu.collectGem()
clear(times: 6)
ex.turnLock(up: true, numberOfTimes: 1)
blu.turnRight()
blu.moveForward()
blu.turnRight()
clear(times:6)
blu.turnLeft()
blu.moveForward()
blu.turnLeft()
clear(times: 6)




////////////////////////////////

```

