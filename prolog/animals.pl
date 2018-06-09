livesWater(salamander).
livesWater(shark).
livesWater(sea_lion).
livesWater(tuna).
livesWater(frog).
livesWater(alligator).

coldBlooded(salamander).
coldBlooded(shark).
coldBlooded(tuna).
coldBlooded(frog).
coldBlooded(alligator).

layEggs(penguin).
layEggs(dove).
layEggs(pigeon).
layEggs(salamander).
layEggs(shark).
layEggs(tuna).
layEggs(frog).
layEggs(alligator).
layEggs(chiken).

livesLand(penguin).
livesLand(elephant).
livesLand(donkey).
livesLand(mouse).
livesLand(dove).
livesLand(pigeon).
livesLand(bat).
livesLand(salamander).
livesLand(dog).
livesLand(human).
livesLand(sea_lion).
livesLand(alligator).
livesLand(frog).
livesLand(chiken).
livesLand(cat).

warmBlooded(penguin).
warmBlooded(elephant).
warmBlooded(donkey).
warmBlooded(mouse).
warmBlooded(dove).
warmBlooded(pigeon).
warmBlooded(bat).
warmBlooded(dog).
warmBlooded(human).
warmBlooded(sea_lion).
warmBlooded(cat).
warmBlooded(chiken).

givesBirth(elephant).
givesBirth(donkey).
givesBirth(mouse).
givesBirth(bat).
givesBirth(dog).
givesBirth(human).
givesBirth(sea_lion).
givesBirth(cat).

lungs(penguin).
lungs(elephant).
lungs(donkey).
lungs(mouse).
lungs(dove).
lungs(pigeon).
lungs(bat).
lungs(salamander).
lungs(dog).
lungs(human).
lungs(sea_lion).
lungs(chiken).
lungs(cat).
lungs(alligator).
lungs(frog).

gills(shark).
gills(tuna).

bornInWater(salamander).
bornInWater(shark).
bornInWater(tuna).
bornInWater(frog).

bornInLand(penguin).
bornInLand(elephant).
bornInLand(donkey).
bornInLand(mouse).
bornInLand(dove).
bornInLand(pigeon).
bornInLand(bat).
bornInLand(dog).
bornInLand(human).
bornInLand(sea_lion).
bornInLand(cat).
bornInLand(chiken).
bornInLand(alligator).


fish(X) :- bornInWater(X),livesWater(X),coldBlooded(X),layEggs(X),gills(X).

amphibian(X):- bornInWater(X),livesWater(X),livesLand(X),coldBlooded(X),layEggs(X),lungs(X).

reptile(X):- bornInLand(X),livesLand(X),livesWater(X),coldBlooded(X),layEggs(X),lungs(X).

mamal(X):- bornInLand(X),livesLand(X),warmBlooded(X),givesBirth(X),lungs(X).

bird(X):- bornInLand(X),livesLand(X),warmBlooded(X),layEggs(X),lungs(X).

class(X,Y):-(mamal(X),Y=mamal),!;
            (bird(X),Y=bird),!;
            (amphibian(X),Y=amphibian),!;
            (reptile(X),Y=reptile),!;
            (fish(X),Y=fish),!;
            (Y='unknown').

habitat(X,Y):-  (livesLand(X),livesWater(X),Y='aquatic and land'),!;
                (livesWater(X),Y=aquatic),!;
                (livesLand(X),Y=land).

reproduction(X,Y):- (layEggs(X),Y='laying eggs'),!;
                    (givesBirth(X),Y='giving birth').

breathingOrgan(X,Y):-   lungs(X),Y=lungs,!;
                        gills(X),Y=gills.

bodyHeat(X,Y):- warmBlooded(X),Y='warm blooded',!;
                coldBlooded(X),y='cold blooded'.

birthPlace(X,Y):- bornInLand(X),Y='land',!;
                  bornInWater(X),Y='water'.

