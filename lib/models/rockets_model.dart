class RocketsModel {
  final double stages;
  final double boosters;
  final double cost;
  final double successrate;
  final String firstflight;
  final String country;
  final String companyname;
  final RocketHeight rocketheight;
  final RocketDiameter rocketdiameter;
  final RocketMass rocketmass;
  final RocketFirst rocketfirst;
  final RocketSecond rocketsecond;
  final RocketEngine rocketengine;
  final List<String> flickrimg;
  final String wikipedia;
  final String description;
  final String rocketname;

  RocketsModel({
    required this.stages,
    required this.boosters,
    required this.cost,
    required this.successrate,
    required this.firstflight,
    required this.country,
    required this.companyname,
    required this.rocketheight,
    required this.rocketdiameter,
    required this.rocketmass,
    required this.rocketfirst,
    required this.rocketsecond,
    required this.rocketengine,
    required this.flickrimg,
    required this.wikipedia,
    required this.description,
    required this.rocketname,
  });

  factory RocketsModel.fromJson(Map<String, dynamic> json) {
    var flickimgjson = json['flickr_images'];
    List<String> flickrimgout = flickimgjson.cast<String>();
    return RocketsModel(
      stages: (json['stages'] as num).toDouble(),
      boosters: (json['boosters'] as num).toDouble(),
      cost: (json['cost_per_launch'] as num).toDouble(),
      successrate: (json['success_rate_pct'] as num).toDouble(),
      firstflight: json['first_flight'],
      country: json['country'],
      companyname: json['company'],
      rocketheight: RocketHeight.fromJson(json['height']),
      rocketdiameter: RocketDiameter.fromJson(json['diameter']),
      rocketmass: RocketMass.fromJson(json['mass']),
      rocketfirst: RocketFirst.fromJson(json['first_stage']),
      rocketsecond: RocketSecond.fromJson(json['second_stage']),
      rocketengine: RocketEngine.fromJson(json['engines']),
      flickrimg: flickrimgout,
      wikipedia: json['wikipedia'],
      description: json['description'],
      rocketname: json['rocket_name'],
    );
  }
}

class RocketHeight {
  final double feet;

  RocketHeight({required this.feet});

  factory RocketHeight.fromJson(Map<String, dynamic> json) {
    return RocketHeight(
      feet: (json['feet'] as num).toDouble(),
    );
  }
}

class RocketDiameter {
  final double feet;

  RocketDiameter({required this.feet});

  factory RocketDiameter.fromJson(Map<String, dynamic> json) {
    return RocketDiameter(
      feet: (json['feet'] as num).toDouble(),
    );
  }
}

class RocketMass {
  final double kg;

  RocketMass({required this.kg});

  factory RocketMass.fromJson(Map<String, dynamic> json) {
    return RocketMass(
      kg: (json['kg'] as num).toDouble(),
    );
  }
}

class RocketFirst {
  final double fuelamount;
  final double? burnsec;

  RocketFirst({
    required this.fuelamount,
    this.burnsec,
  });

  factory RocketFirst.fromJson(Map<String, dynamic> json) {
    return RocketFirst(
      fuelamount: (json['fuel_amount_tons'] as num).toDouble(),
      burnsec: (json['burn_time_sec'] as num?)?.toDouble(),
    );
  }
}

class RocketSecond {
  final double fuelamount;
  final double? burnsec;

  RocketSecond({
    required this.fuelamount,
    this.burnsec,
  });

  factory RocketSecond.fromJson(Map<String, dynamic> json) {
    return RocketSecond(
      fuelamount: (json['fuel_amount_tons'] as num).toDouble(),
      burnsec: (json['burn_time_sec'] as num?)?.toDouble(),
    );
  }
}

class RocketEngine {
  final String propel1;
  final String propel2;
  final double thrust;

  RocketEngine({
    required this.propel1,
    required this.propel2,
    required this.thrust,
  });

  factory RocketEngine.fromJson(Map<String, dynamic> json) {
    return RocketEngine(
      propel1: json['propellant_1'],
      propel2: json['propellant_2'],
      thrust: (json['thrust_to_weight'] as num).toDouble(),
    );
  }
}
