import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertests/domain/garden.dart';
import 'package:fluttertests/domain/plant.dart';

void main() {

  group('Main garden test', (){

    //Check if gardens are not empty
    test('Initial test', () {
      Garden garden = Garden();
      garden.plantGardens();
      garden.greenhouse.forEach((key, particularGarden) {
        expect(particularGarden.isNotEmpty, true);
      });
    });

    //Check if gardens are 2 length exactly
    test('Initial count test', () {
      Garden garden = Garden();
      garden.plantGardens();
      garden.greenhouse.forEach((key, particularGarden) {
        expect(particularGarden.length, 2);
      });
    });

    //Try to add not uniqe plant to gardens
    test('Uniqeness test', () {
      Garden garden = Garden();
      garden.plantGardens();
      garden.addPlantTo("My garden", Plant("First plant", PlantGroup.GREEN_ALGAE, PlantDivision.MAGNOLIOPHYTA));
      garden.addPlantTo("Mother's garden", Plant("First plant", PlantGroup.SEED_PLANTS, PlantDivision.LYCOPODIAPHYTA));
      garden.addPlantTo("Father's garden", Plant("First plant", PlantGroup.SEED_PLANTS, PlantDivision.GINKGOPHYTA));
      garden.addPlantTo("Neighbour's garden", Plant("First plant", PlantGroup.GREEN_ALGAE, PlantDivision.PTERIDOPHYTA));
      garden.greenhouse.forEach((key, particularGarden) {
        expect(particularGarden.length, 2);
      });
    });

    //Try to add uniqe plant to gardens
    test('Count test', () {
      Garden garden = Garden();
      garden.plantGardens();
      garden.addPlantTo("My garden", Plant("Third plant", PlantGroup.GREEN_ALGAE, PlantDivision.PINOPHYTA));
      garden.addPlantTo("Mother's garden", Plant("Third plant", PlantGroup.PTERIDOPHYTES, PlantDivision.PTERIDOPHYTA));
      garden.addPlantTo("Father's garden", Plant("Third plant", PlantGroup.BRYOPHYTES, PlantDivision.GNETOPHYTA));
      garden.addPlantTo("Neighbour's garden", Plant("Third plant", PlantGroup.BRYOPHYTES, PlantDivision.MARCHANTIOPHYTA));
      garden.greenhouse.forEach((key, particularGarden) {
        expect(particularGarden.length, 3);
      });
    });

    //Check validity of plants added
    test('Validity check', () {
      Garden garden = Garden();
      garden.plantGardens();
      garden.greenhouse.forEach((key, particularGarden){
        particularGarden.forEach((plant){
          expect(plant.group.getPlantDivisions().contains(plant.division), true);
        });
      });
    });

  });

}