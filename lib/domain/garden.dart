import 'package:fluttertests/domain/plant.dart';

class Garden {

  Map<String, Set<Plant>> greenhouse = {};

  void plantGardens() {

    greenhouse["My garden"] = {};
    greenhouse["Neighbour's garden"] = {};
    greenhouse["Mother's garden"] = {};
    greenhouse["Father's garden"] = {};

    greenhouse["My garden"].addAll({ Plant("First plant", PlantGroup.GREEN_ALGAE, PlantDivision.MAGNOLIOPHYTA), Plant("Second plant", PlantGroup.GREEN_ALGAE, PlantDivision.MAGNOLIOPHYTA) });
    greenhouse["Neighbour's garden"].addAll({ Plant("First plant", PlantGroup.GREEN_ALGAE, PlantDivision.PTERIDOPHYTA), Plant("Second plant", PlantGroup.GREEN_ALGAE, PlantDivision.MAGNOLIOPHYTA)});
    greenhouse["Mother's garden"].addAll({ Plant("First plant", PlantGroup.SEED_PLANTS, PlantDivision.LYCOPODIAPHYTA), Plant("Second plant", PlantGroup.GREEN_ALGAE, PlantDivision.MAGNOLIOPHYTA)});
    greenhouse["Father's garden"].addAll({ Plant("First plant", PlantGroup.SEED_PLANTS, PlantDivision.GINKGOPHYTA), Plant("Second plant", PlantGroup.GREEN_ALGAE, PlantDivision.MAGNOLIOPHYTA)});

  }

  void addPlantTo(String gardenName, Plant newPlant) {
    greenhouse[gardenName].add(newPlant);
  }

}