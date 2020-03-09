import 'package:flutter/cupertino.dart';

class Plant implements ClassifiedPlant, NamedPlant {

  String _name;
  PlantGroup _group;
  PlantDivision _division;

  Plant(this._name, this._group, this._division);

  @override
  String get name {
    return this._name;
  }

  @override
  PlantDivision get division {
    return this._division;
  }

  @override
  PlantGroup get group {
    return this._group;
  }

  @override
  bool operator ==(other) {
    return other is Plant && other.name == _name && other.group == _group && other.division == _division;
  }

  @override
  int get hashCode {
    return hashValues(_name.hashCode, _group.hashCode, _division.hashCode);
  }

}

class ClassifiedPlant {

  PlantGroup get group {
    return null;
  }

  PlantDivision get division {
    return null;
  }

}

class NamedPlant {

  String get name {
    return null;
  }

}

enum PlantGroup {
  GREEN_ALGAE, BRYOPHYTES, PTERIDOPHYTES, SEED_PLANTS
}

enum PlantDivision {
  CHLOROPHYTA, CHAROPHYTA,
  MARCHANTIOPHYTA, ANTHOCEROTOPHYTA, BRYOPHYTA,
  LYCOPODIAPHYTA, PTERIDOPHYTA,
  CYCADOPHYTA, GINKGOPHYTA, PINOPHYTA, GNETOPHYTA, MAGNOLIOPHYTA
}

extension PGDivision on PlantGroup {
  Set<PlantDivision> getPlantDivisions() {
    switch (this) {
      case PlantGroup.GREEN_ALGAE: return { PlantDivision.CHLOROPHYTA, PlantDivision.CHAROPHYTA };
      case PlantGroup.BRYOPHYTES: return { PlantDivision.MARCHANTIOPHYTA, PlantDivision.ANTHOCEROTOPHYTA, PlantDivision.BRYOPHYTA };
      case PlantGroup.PTERIDOPHYTES: return { PlantDivision.LYCOPODIAPHYTA, PlantDivision.PTERIDOPHYTA };
      case PlantGroup.SEED_PLANTS: return { PlantDivision.CYCADOPHYTA, PlantDivision.GINKGOPHYTA, PlantDivision.PINOPHYTA, PlantDivision.GNETOPHYTA, PlantDivision.MAGNOLIOPHYTA };
    }
  }
}

extension PDCommonName on PlantDivision {
  String getCommonName() {
    switch (this) {
      case PlantDivision.CHLOROPHYTA: return "Green algae";
      case PlantDivision.CHAROPHYTA: return "Green algae";

      case PlantDivision.MARCHANTIOPHYTA: return "Liverworts";
      case PlantDivision.ANTHOCEROTOPHYTA: return "Hornworts";
      case PlantDivision.BRYOPHYTA: return "Mosses";

      case PlantDivision.LYCOPODIAPHYTA: return "Club mosses";
      case PlantDivision.PTERIDOPHYTA: return "Ferns, whisk ferns & horsetails";

      case PlantDivision.CYCADOPHYTA: return "Cycads";
      case PlantDivision.GINKGOPHYTA: return "Ginkgo";
      case PlantDivision.PINOPHYTA: return "Conifers";
      case PlantDivision.GNETOPHYTA: return "Gnetophytes";
      case PlantDivision.MAGNOLIOPHYTA: return "Flowering plants";
    }
  }
}