//
//  Suggestions Data.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/31/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation

class SuggestionsData {
    
    static var suggestions = [String: String]()
    static var suggestionsArray = [String]()
    
    static func prepareSuggestions() {
        
        
        //GIVE SUGGESTIONS BASED ON EDUCATION LEVEL
        
        switch LifeSpecs.lifeSpecifications.educationLevel {
        case "Some high school":
            let yearsToAdd = LifeExpectancyCalculator.educationImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["education"] = "If you go back to school, you will add \(yearsToAdd) years to your life. Education is linked to lifelong health and wellbeing. According to the Center on Society and Health, 'in today’s knowledge economy, education paves a path to good jobs: Completing more years of education confers health benefits after leaving school, such as better health insurance, access to medical care, and the resources to live a healthier lifestyle and to reside in healthier homes and neighborhoods.' Source: http://www.prb.org/Publications/Reports/2013/us-educational-attainment-mortality.aspx"
        default:
            suggestions.removeValue(forKey: "education")
        }
        
        
        //GIVE SUGGESTIONS BASED ON BMI
        switch LifeSpecs.lifeSpecifications.BMI {
        case "pre-obese":
            let yearsToAdd = LifeExpectancyCalculator.bmiImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["BMI"] = "Being overweight has severe effects. It can lead to high blood pressure, diabetes, and heart disease, which are all factors that shorten life span. If you strive to maintain a healthier weight, you could add \(yearsToAdd) years to your life. Source: https://www.nih.gov/news-events/news-releases/nih-study-finds-extreme-obesity-may-shorten-life-expectancy-14-years"
        case "obese":
            let yearsToAdd = LifeExpectancyCalculator.bmiImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["BMI"] = "Obesity has severe effects. It can lead to high blood pressure, diabetes, and heart disease, which are all factors that shorten life span. If you strive to maintain a healthier weight, you could add \(yearsToAdd) years to your life. Source: https://www.nih.gov/news-events/news-releases/nih-study-finds-extreme-obesity-may-shorten-life-expectancy-14-years"
        case "underweight":
            let yearsToAdd = LifeExpectancyCalculator.bmiImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["BMI"] = "Being underweight can shorten your lifespan. In fact, Toronto researchers who analyzed 51 studies on the links between body mass index and death found that adults who are underweight have a 1.8 times higher risk of dying than those with a normal BMI of 18.5 to 24.9. If you increase your BMI to the normal range, you could add \(yearsToAdd) years to your life. Source: http://bmjopen.bmj.com/content/2/3/e000940"
        default:
            suggestions.removeValue(forKey: "BMI")
        }
        
        //GIVE SUGGESTIONS BASED ON EXERCISE
        switch LifeSpecs.lifeSpecifications.numExerciseDays{
        case "zero":
            let yearsToAdd = LifeExpectancyCalculator.exerciseImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of exercise days"] = "Regular exercise is crucial to maintaining a healthy lifestyle, and the benefits are obvious. Not only will exercising more regularly improve your sleep quality, improve your mood, boost your energy levels, and reduce your risk for heart disease, but if you start exercising more regularly, you could add more years to your life. If you start exercising 3 days a week, you could add half a year to your life, 4 days a week could add a year and a half, 5 days a week could add 3 years, and 6 or 7 days a week could add 5 years to your life expectancy. Source: https://www.cancer.gov/news-events/press-releases/2012/PhysicalActivityLifeExpectancy"
        case "one":
            let yearsToAdd = LifeExpectancyCalculator.exerciseImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of exercise days"] = "Regular exercise is crucial to maintaining a healthy lifestyle, and the benefits are obvious. Not only will exercising more regularly improve your sleep quality, improve your mood, boost your energy levels, and reduce your risk for heart disease, but if you start exercising more regularly, you could add more years to your life. If you start exercising 3 days a week, you could add half a year to your life, 4 days a week could add a year and a half, 5 days a week could add 3 years, and 6 or 7 days a week could add 5 years to your life expectancy. Source: https://www.cancer.gov/news-events/press-releases/2012/PhysicalActivityLifeExpectancy"
        case "two":
            let yearsToAdd = LifeExpectancyCalculator.exerciseImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of exercise days"] = "Regular exercise is crucial to maintaining a healthy lifestyle, and the benefits are obvious. Not only will exercising more regularly improve your sleep quality, improve your mood, boost your energy levels, and reduce your risk for heart disease, but if you start exercising more regularly, you could add more years to your life. If you start exercising 3 days a week, you could add half a year to your life, 4 days a week could add a year and a half, 5 days a week could add 3 years, and 6 or 7 days a week could add 5 years to your life expectancy. Source: https://www.cancer.gov/news-events/press-releases/2012/PhysicalActivityLifeExpectancy"
        case "three":
            let yearsToAdd = LifeExpectancyCalculator.exerciseImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of exercise days"] = "Regular exercise is crucial to maintaining a healthy lifestyle, and the benefits are obvious. Not only will exercising more regularly improve your sleep quality, improve your mood, boost your energy levels, and reduce your risk for heart disease, but if you start exercising more regularly, you could add more years to your life. If you start exercising 4 days a week, you could add a year and a half to your life, 5 days a week could add 3 years, and 6 or 7 days a week could add 5 years to your life expectancy. Source: https://www.cancer.gov/news-events/press-releases/2012/PhysicalActivityLifeExpectancy"
        case "four":
            let yearsToAdd = LifeExpectancyCalculator.exerciseImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of exercise days"] = "While you are already exercising a good number of days out of the week, if you start exercising 5 days a week, you could add 1 year to your life, and if you exercise 6 or 7 days a week, you could add 2 years to your life expectancy. Source: https://www.cancer.gov/news-events/press-releases/2012/PhysicalActivityLifeExpectancy"
        case "five":
            let yearsToAdd = LifeExpectancyCalculator.exerciseImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of exercise days"] = "While you are already exercising a good number of days out of the week, if you exercise 6 or 7 days a week, you could add 1 year to your life expectancy. Source: https://www.cancer.gov/news-events/press-releases/2012/PhysicalActivityLifeExpectancy"
        default:
            suggestions.removeValue(forKey: "number of exercise days")
        }
        
        //GIVE SUGGESTIONS BASED ON FLOSSING
        switch LifeSpecs.lifeSpecifications.flossInfo {
        case "no":
//            let yearsToAdd = LifeExpectancyCalculator.flossingImpact(lifeSpecs: LifeSpecs.lifeSpecifications) * -1
            let yearsToAdd = LifeExpectancyCalculator.flossingImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["flossing"] = "There is a link between gum disease and heart disease. Flossing once a day will add \(yearsToAdd) years to your life. Source: http://www.businessinsider.com/the-links-between-flossing-and-longevity-2015-6"
        default:
            suggestions.removeValue(forKey: "flossing")
        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON NUMBER OF HOURS USER WORKS PER WEEK
        switch LifeSpecs.lifeSpecifications.numWorkHours {
        case "fortyOneToSixtyHoursPerWeekOfWorkSelected":
            let yearsToAdd = LifeExpectancyCalculator.numHoursWorkPerWeek(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of work hours"] = "Did you know that working a fewer number of hours per week (40 or less) could add \(yearsToAdd) years to your life? Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        case "sixtyOneToEightyHoursPerWeekOfWorkSelected":
            let yearsToAdd = LifeExpectancyCalculator.numHoursWorkPerWeek(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of work hours"] = "Did you know that working a fewer number of hours per week (40 or less) could add \(yearsToAdd) years to your life? Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        case "moreThanEightyHoursPerWeekOfWorkSelected":
            let yearsToAdd = LifeExpectancyCalculator.numHoursWorkPerWeek(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of work hours"] = "Did you know that working a fewer number of hours per week (40 or less) could add \(yearsToAdd) years to your life? Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        default:
            suggestions.removeValue(forKey: "number of work hours")
        }
        
        
        
        
        
        //GIVE SUGGESTIONS BASED ON NUMBER OF DAYS USER WORKS PER WEEK
        switch LifeSpecs.lifeSpecifications.numWorkDays {
        case "sixDayWorkWeekSelected":
            let yearsToAdd = LifeExpectancyCalculator.numDaysWorkPerWeek(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of work days per week"] = "If you aim to work one day less a week, you could add \(yearsToAdd) year to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        case "sevenDayWorkWeekSelected":
            let yearsToAdd = LifeExpectancyCalculator.numDaysWorkPerWeek(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["number of work days per week"] = "If you aim to work one day less a week, you could add 1 year to your life, and if you work 2 days less per week you could add \(yearsToAdd) years to your life! Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        default:
            suggestions.removeValue(forKey: "number of work days per week")
        }
        
        
        
        //GIVE SUGGESTIONS BASED ON AIR QUALITY WHERE USER LIVES
        switch LifeSpecs.lifeSpecifications.airQuality {
        case "slightlyPollutedAirQualitySelected":
            let yearsToAdd = LifeExpectancyCalculator.airQuality(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["air quality"] = "Breathing polluted air can put you at a greater risk for asthma and other respiratory diseases. If you move to a less polluted area, you could add \(yearsToAdd) years to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        case "veryPollutedAirQualitySelected":
            let yearsToAdd = LifeExpectancyCalculator.airQuality(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["air quality"] = "Breathing polluted air can put you at a greater risk for asthma and other respiratory diseases. If you move to a less polluted area, you could add \(yearsToAdd) years to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        default:
            suggestions.removeValue(forKey: "air quality")
        }
        
        
        
        //GIVE SUGGESTIONS BASED ON PET OWNERSHIP
//        switch LifeSpecs.lifeSpecifications.seatbeltInfo {
//        case "no":
//            let yearsToAdd = LifeExpectancyCalculator.seatbeltImpact(lifeSpecs: LifeSpecs.lifeSpecifications) * -1
//            suggestions["pet"] = "Did you know that owning a pet could add \(yearsToAdd) years to your life? Pets, especially dogs, are not only adorable but they also lead to a longer life by being consistently loving and by being great companions."
//        default:
//            suggestions.removeValue(forKey: "pet")
//        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON SLEEP
        switch LifeSpecs.lifeSpecifications.numSleepHours {
        case "lessThanFiveHoursSleepSelected":
            let yearsToAdd = LifeExpectancyCalculator.sleepImpact(lifeSpecs:LifeSpecs.lifeSpecifications)
            suggestions["sleep"] = "Sleep deprivation can lead to obesity, diabetes, heart disease, anxiety, depression, and alcohol abuse. You could add \(yearsToAdd) years to your life by going to bed 15 minutes earlier or by getting at least 7 hours of sleep per night. Source: http://www.culver.k12.in.us/index.php/document-library/health-services/health-e-news/1346-10-tips-to-living-forever-young/file"
        case "moreThanNineHoursSleepSelected":
            let yearsToAdd = LifeExpectancyCalculator.sleepImpact(lifeSpecs:LifeSpecs.lifeSpecifications)
            suggestions["sleep"] = "Sleeping too much can have harmful effects. If you decrease the number of hours you sleep each night to 7 to 9 hours of sleep, you could add \(yearsToAdd) years to your life. Source: http://www.culver.k12.in.us/index.php/document-library/health-services/health-e-news/1346-10-tips-to-living-forever-young/file"
        case "fiveToSixHoursSleepSelected":
            let yearsToAdd = LifeExpectancyCalculator.sleepImpact(lifeSpecs:LifeSpecs.lifeSpecifications)
            suggestions["sleep"] = "Sleep deprivation can lead to obesity, diabetes, heart disease, anxiety, depression, and alcohol abuse. You could add \(yearsToAdd) years to your life by going to bed 15 minutes earlier or by getting at least 7 hours of sleep per night. Source: http://www.culver.k12.in.us/index.php/document-library/health-services/health-e-news/1346-10-tips-to-living-forever-young/file"
        default:
            suggestions.removeValue(forKey: "sleep")
        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON STRESS LEVELS
        switch LifeSpecs.lifeSpecifications.stressLevels {
        case "mediumStressLevelsSelected":
            let yearsToAdd = LifeExpectancyCalculator.stressLevelsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["stress"] = "Being too stressed out can damage your immune system, making it easier for your body to get sick. If you work towards decreasing your stress levels, you could add \(yearsToAdd) years to your life. Source: http://www.culver.k12.in.us/index.php/document-library/health-services/health-e-news/1346-10-tips-to-living-forever-young/file"
        case "highStressLevelsSelected":
            let yearsToAdd = LifeExpectancyCalculator.stressLevelsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["stress"] = "Being too stressed out can damage your immune system, making it easier for your body to get sick. If you work towards decreasing your stress levels, you could add \(yearsToAdd) years to your life. Source: http://www.culver.k12.in.us/index.php/document-library/health-services/health-e-news/1346-10-tips-to-living-forever-young/file"
        default:
            suggestions.removeValue(forKey: "stress")
        }
        
        
        
        
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER RECEIVES PERSONAL CONTACT FROM FAMILY MEMBERS
        switch LifeSpecs.lifeSpecifications.personalContact {
        case "rare personal contact":
            let yearsToAdd = LifeExpectancyCalculator.personalContactImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["contact"] = "Research has shown how important it is to receive personal contact from family and friends on a weekly basis. If you reach out to these people at least a few times a week, you could add at least \(yearsToAdd) year to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        default:
            suggestions.removeValue(forKey: "contact")
        }
        
        
        
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER HAS COFFEE
        switch LifeSpecs.lifeSpecifications.numCoffeeCups {
        case "one to two cups":
            let yearsToAdd = LifeExpectancyCalculator.coffeeImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["coffee"] = "Drinking too much coffee can damage your liver and lead to high blood pressure. If you cut out one cup of coffee every day, you could add   \(yearsToAdd) years to your life. Source: http://www.webmd.com/healthy-aging/news/20130815/heavy-coffee-drinking-tied-to-shorter-lives-for-younger-adults-in-study#1"
        case "two to three cups":
            let yearsToAdd = LifeExpectancyCalculator.coffeeImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["coffee"] = "Drinking too much coffee can damage your liver and lead to high blood pressure. If you cut out one cup of coffee every day, you could add   \(yearsToAdd) years to your life. Source: http://www.webmd.com/healthy-aging/news/20130815/heavy-coffee-drinking-tied-to-shorter-lives-for-younger-adults-in-study#1"
        default:
            suggestions.removeValue(forKey: "coffee")
        }
        
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER EATS DAIRY
        switch LifeSpecs.lifeSpecifications.numDairy {
        case "zero to one":
            let yearsToAdd = LifeExpectancyCalculator.dairyImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["dairy"] = "Consuming too few servings of dairy means you are not getting enough calcium, which can make your bones very weak. If you have another serving of dairy every day, you could add \(yearsToAdd) years to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        default:
            suggestions.removeValue(forKey: "dairy")
        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER EATS CANDY
        switch LifeSpecs.lifeSpecifications.sweetsInfo {
        case "threetofivedaysperweek":
            let yearsToAdd = LifeExpectancyCalculator.sweetsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["candy"] = "If you try to cut back on eating sweet foods to one to two days per week, you could add    \(yearsToAdd) years to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        case "onceaday":
            let yearsToAdd = LifeExpectancyCalculator.sweetsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["candy"] = "If you try to cut back on eating sweet foods to three to five days per week, you could add \(yearsToAdd) years to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        case "morethanonceaday":
            let yearsToAdd = LifeExpectancyCalculator.sweetsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["candy"] = "If you try to cut back on eating sweet foods to just once per day, you could add \(yearsToAdd) years to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        default:
            suggestions.removeValue(forKey: "candy")
        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER HAS CARBS
        //don't have the research yet
        
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER EATS RED MEAT
        switch LifeSpecs.lifeSpecifications.redMeatInfo {
        case "3to5":
            let yearsToAdd = LifeExpectancyCalculator.redMeatImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["red meat"] = "Since red meat is high in saturated fat, consuming too much of it can raise blood cholesterol levels (which increases the risk of heart disease). If you limit yourself to eating red meat only 1 or 2 days per week, you could add \(yearsToAdd) years to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        case "6to7":
            let yearsToAdd = LifeExpectancyCalculator.redMeatImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["red meat"] = "Since red meat is high in saturated fat, consuming too much of it can raise blood cholesterol levels (which increases the risk of heart disease). If you limit yourself to eating red meat only 1 or 2 days per week, you could add \(yearsToAdd) years to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        default:
            suggestions.removeValue(forKey: "red meat")
        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER EATS FAST FOODS
        switch LifeSpecs.lifeSpecifications.fastFoodsInfo {
        case "1to2":
            let yearsToAdd = LifeExpectancyCalculator.fastFoodsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["fast foods"] = "Eating too much fast food increases your risk for type 2 diabetes and heart disease. Removing fast foods from your diet could add  \(yearsToAdd) year to your life. Source: http://www.nbcnews.com/id/7209499/ns/health-health_care/t/us-life-expectancy-may-drop-due-obesity/"
        case "3to4":
            let yearsToAdd = LifeExpectancyCalculator.fastFoodsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["fast foods"] = "Eating too much fast food increases your risk for type 2 diabetes and heart disease. Removing fast foods from your diet could add  \(yearsToAdd) years to your life. Source: http://www.nbcnews.com/id/7209499/ns/health-health_care/t/us-life-expectancy-may-drop-due-obesity/"
        case "over5":
            let yearsToAdd = LifeExpectancyCalculator.fastFoodsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["fast foods"] = "Eating too much fast food increases your risk for type 2 diabetes and heart disease. Removing fast foods from your diet could add  \(yearsToAdd) years to your life. Source: http://www.nbcnews.com/id/7209499/ns/health-health_care/t/us-life-expectancy-may-drop-due-obesity/"
        default:
            suggestions.removeValue(forKey: "fast foods")
        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON WHETHER OR NOT USER SMOKES
        
//        if LifeSpecs.lifeSpecifications.isSmoking {
//            let yearsToAdd = LifeExpectancyCalculator.smokingImpact(lifeSpecs: LifeSpecs.lifeSpecifications) * -1
//            suggestions["smoking"] = "If you quit smoking, you will add \(yearsToAdd) years to your life!"
//        } else {
//            suggestions.removeValue(forKey: "smoking")
//        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON HOW MANY CIGS USER SMOKES
        switch LifeSpecs.lifeSpecifications.numCigarettesPerDay {
        case "oneCigToHalfAPack":
            let yearsToAdd = LifeExpectancyCalculator.smokingImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["cigs"] = "Smoking kills. It not only increases your risk of getting cancer, but it also increases your risk of having a heart attack or stroke. If you quit now, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/tobacco/data_statistics/fact_sheets/health_effects/tobacco_related_mortality/index.htm"
        case "onePackCigPerDay":
            let yearsToAdd = LifeExpectancyCalculator.smokingImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["cigs"] = "Smoking kills. It not only increases your risk of getting cancer, but it also increases your risk of having a heart attack or stroke. If you quit now, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/tobacco/data_statistics/fact_sheets/health_effects/tobacco_related_mortality/index.htm"
        case "oneAndAHalfPacksPerDay":
            let yearsToAdd = LifeExpectancyCalculator.smokingImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["cigs"] = "Smoking kills. It not only increases your risk of getting cancer, but it also increases your risk of having a heart attack or stroke. If you quit now, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/tobacco/data_statistics/fact_sheets/health_effects/tobacco_related_mortality/index.htm"
        case "twoPacksPerDay":
            let yearsToAdd = LifeExpectancyCalculator.smokingImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["cigs"] = "Smoking kills. It not only increases your risk of getting cancer, but it also increases your risk of having a heart attack or stroke. If you quit now, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/tobacco/data_statistics/fact_sheets/health_effects/tobacco_related_mortality/index.htm"
        case "threeOrMorePacksPerDay":
            let yearsToAdd = LifeExpectancyCalculator.smokingImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["cigs"] = "Smoking kills. It not only increases your risk of getting cancer, but it also increases your risk of having a heart attack or stroke. If you quit now, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/tobacco/data_statistics/fact_sheets/health_effects/tobacco_related_mortality/index.htm"
        default:
            suggestions.removeValue(forKey: "cigs")
        }
     
        
        
        
        
        //GIVE SUGGESTIONS BASED ON SECOND HAND SMOKING
        switch LifeSpecs.lifeSpecifications.secondHandSmoke {
        case "dailySecondHand":
            let yearsToAdd = LifeExpectancyCalculator.secondHandSmokingImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["second hand smoke"] = "Being exposed to second hand smoke is incredibly damaging to your heart and increases your risk for cancer. If you lessen your exposure to second hand smoke, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/tobacco/data_statistics/fact_sheets/secondhand_smoke/general_facts/index.htm"
        case "fewTimesPerWeekExposure":
            let yearsToAdd = LifeExpectancyCalculator.secondHandSmokingImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["second hand smoke"] = "Being exposed to second hand smoke is incredibly damaging to your heart and increases your risk for cancer. If you lessen your exposure to second hand smoke, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/tobacco/data_statistics/fact_sheets/secondhand_smoke/general_facts/index.htm"
        case "oncePerWeekExposure":
            let yearsToAdd = LifeExpectancyCalculator.secondHandSmokingImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["second hand smoke"] = "Being exposed to second hand smoke is incredibly damaging to your heart and increases your risk for cancer. If you lessen your exposure to second hand smoke, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/tobacco/data_statistics/fact_sheets/secondhand_smoke/general_facts/index.htm"
        default:
            suggestions.removeValue(forKey: "second hand smoke")
        }
        
        
        
        
        //GET HELP WITH THESE CALCULATIONS
        
//        //GIVE SUGGESTIONS BASED ON HOW MANY NIGHTS PER WEEK USER SPENDS DRINKING
//        
//        switch LifeSpecs.lifeSpecifications.numNightsSpentDrinking {
//        case "Some high school":
//            let yearsToAdd = LifeExpectancyCalculator.educationImpact(lifeSpecs: LifeSpecs.lifeSpecifications) * -1
//            suggestions["num nights spent drinking"] = "If you go back to school, you will add \(yearsToAdd) years to your life. Education is linked to lifelong health and wellbeing. According to the Center on Society and Health, 'in today’s knowledge economy, education paves a path to good jobs: Completing more years of education confers health benefits after leaving school, such as better health insurance, access to medical care, and the resources to live a healthier lifestyle and to reside in healthier homes and neighborhoods.'"
//        default:
//            suggestions.removeValue(forKey: "num nights spent drinking")
//        }
//        
//        
//        
//        
//        
//        //GIVE SUGGESTIONS BASED ON HOW MANY DRINKS USER HAS PER NIGHT
//        switch LifeSpecs.lifeSpecifications.numDrinksPerNight {
//        case "Some high school":
//            let yearsToAdd = LifeExpectancyCalculator.educationImpact(lifeSpecs: LifeSpecs.lifeSpecifications) * -1
//            suggestions["num drinks per night"] = "If you go back to school, you will add \(yearsToAdd) years to your life. Education is linked to lifelong health and wellbeing. According to the Center on Society and Health, 'in today’s knowledge economy, education paves a path to good jobs: Completing more years of education confers health benefits after leaving school, such as better health insurance, access to medical care, and the resources to live a healthier lifestyle and to reside in healthier homes and neighborhoods.'"
//        default:
//            suggestions.removeValue(forKey: "num drinks per night")
//        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER INJECTS ILLEGAL DRUGS
        switch LifeSpecs.lifeSpecifications.illegalDrugsInfo {
        case "drugsFewTimesPerYearSelected":
            let yearsToAdd = LifeExpectancyCalculator.drugsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["drugs"] = "Injecting illegal drugs is extremely dangerous and severly increases mortality rates. If you stop injecting illegal drugs now, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/nchs/fastats/drug-use-illegal.htm"
        case "drugsEveryFewMonthsSelected":
            let yearsToAdd = LifeExpectancyCalculator.drugsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["drugs"] = "Injecting illegal drugs is extremely dangerous and severly increases mortality rates. If you stop injecting illegal drugs now, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/nchs/fastats/drug-use-illegal.htm"
        case "drugsOnceOrMorePerMonth":
            let yearsToAdd = LifeExpectancyCalculator.drugsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["drugs"] = "Injecting illegal drugs is extremely dangerous and severly increases mortality rates. If you stop injecting illegal drugs now, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/nchs/fastats/drug-use-illegal.htm"
        case "drugsOncePerYear":
            let yearsToAdd = LifeExpectancyCalculator.drugsImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["drugs"] = "Injecting illegal drugs is extremely dangerous and severly increases mortality rates. If you stop injecting illegal drugs now, you could add \(yearsToAdd) years to your life. Source: https://www.cdc.gov/nchs/fastats/drug-use-illegal.htm"
        default:
            suggestions.removeValue(forKey: "drugs")
        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON CHOLESTEROL LEVELS (GOOD LEVELS)
        switch LifeSpecs.lifeSpecifications.hdlLevels {
        case "low":
            let yearsToAdd = LifeExpectancyCalculator.hdlImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["hdl"] = "Low HDL cholesterol levels are linked to an increased risk for developing cardiovascular disease. If you increase your HDL levels to the normal range, you could add \(yearsToAdd) years to your life. Source: http://www.nytimes.com/ref/health/healthguide/esn-cholesterol-expert.html"
        default:
            suggestions.removeValue(forKey: "hdl")
        }
        
        
        
        
        //GIVE SUGGESTIONS BASED ON CHOLESTEROL LEVELS (BAD LEVELS)
        switch LifeSpecs.lifeSpecifications.ldlLevels {
        case "high":
            let yearsToAdd = LifeExpectancyCalculator.ldlImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["ldl"] = "Higher levels of LDL raise your chances of a heart attack. If you lower your LDL cholesterol levels, you could add \(yearsToAdd) years to your life. Source: http://www.nytimes.com/ref/health/healthguide/esn-cholesterol-expert.html"
        default:
            suggestions.removeValue(forKey: "ldl")
        }
        
        
        
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER IS SCREENED FOR CANCER
        switch LifeSpecs.lifeSpecifications.cancerScreeningInfo {
        case "noCancerScreeningSelected":
            let yearsToAdd = LifeExpectancyCalculator.cancerScreeningImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["cancer screening"] = "Being regularly screened for cancer is extremely important to your health. Just by checking in with the doctor yearly, you could add \(yearsToAdd) year to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        default:
            suggestions.removeValue(forKey: "cancer screening")
        }
        
        
       //GIVE SUGGESTIONS BASED ON HOW OFTEN USER WEARS SUNSCREEN
        switch LifeSpecs.lifeSpecifications.sunProtectionInfo {
        case "sometimesSunscreen":
            let yearsToAdd = LifeExpectancyCalculator.sunscreenImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["sun"] = "Increased exposure to sunlight without protection can lead to skin cancer. If you start being more cautious about protecting your skin from the sun, you could add \(yearsToAdd) years to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
        case "rarelySunscreenSelected":
            let yearsToAdd = LifeExpectancyCalculator.sunscreenImpact(lifeSpecs: LifeSpecs.lifeSpecifications)
            suggestions["cancer screening"] = "Increased exposure to sunlight without protection can lead to skin cancer. If you start being more cautious about protecting your skin from the sun, you could add \(yearsToAdd) years to your life. Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"

        default:
            suggestions.removeValue(forKey: "sun")
        }
        
        //GIVE SUGGESTIONS BASED ON PET OWNERSHIP
        switch LifeSpecs.lifeSpecifications.petOwner {
            case "no":
            let yearsToAdd = LifeExpectancyCalculator.petImpact(lifeSpaces: LifeSpecs.lifeSpecifications)
            suggestions["pet"] = "Did you know that owning a pet could add 2 years to your life? Pets, especially dogs, are not only adorable but they also lead to a longer life by being consistently loving and by being great companions. Source: http://www.health.harvard.edu/blog/a-dog-could-be-your-hearts-best-friend-201305226291"
        default:
            suggestions.removeValue(forKey: "pet")
        }
        
        //GIVE SUGGESTIONS BASED ON ALCOHOL CONSUMPTION
        switch LifeSpecs.lifeSpecifications.numNightsSpentDrinking {
            case "oneToTwoDaysDrinkingPerWeekSelected":
                switch LifeSpecs.lifeSpecifications.numDrinksPerNight {
                case "aboutThreeDrinksPerNightSelected":
                    let yearsToAdd = LifeExpectancyCalculator.alcoholImpactNumDrinks(lifeSpecs: LifeSpecs.lifeSpecifications)
                    suggestions["alcohol"] = "If you cut back on one alcoholic beverage each night you spend drinking, you could add \(yearsToAdd) years to your life! Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
                case "atLeastThreeDrinksPerNightSelected":
                    let yearsToAdd = LifeExpectancyCalculator.alcoholImpactNumDrinks(lifeSpecs: LifeSpecs.lifeSpecifications)
                    suggestions["alcohol"] = "If you cut back on one alcoholic beverage each night you spend drinking, you could add \(yearsToAdd) years to your life! Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
                default:
                    suggestions.removeValue(forKey: "alcohol")
                }
            case "threeToFiveDaysDrinkingPerWeekSelected":
                switch LifeSpecs.lifeSpecifications.numDrinksPerNight {
                    case "aboutThreeDrinksPerNightSelected":
                    let yearsToAdd = LifeExpectancyCalculator.alcoholImpactNumDrinks(lifeSpecs: LifeSpecs.lifeSpecifications)
                    suggestions["alcohol"] = "If you cut back on one alcoholic beverage each night you spend drinking, you could add \(yearsToAdd) years to your life! Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
                    case "atLeastThreeDrinksPerNightSelected":
                    let yearsToAdd = LifeExpectancyCalculator.alcoholImpactNumDrinks(lifeSpecs: LifeSpecs.lifeSpecifications)
                    suggestions["alcohol"] = "If you cut back on one alcoholic beverage each night you spend drinking, you could add \(yearsToAdd) years to your life! Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
                default:
                    suggestions.removeValue(forKey: "alcohol")

            }
            case "sixToSevenDaysDrinkningPerWeek":
                switch LifeSpecs.lifeSpecifications.numDrinksPerNight {
                    case "aboutThreeDrinksPerNightSelected":
                    let yearsToAdd = LifeExpectancyCalculator.alcoholImpactNumDrinks(lifeSpecs: LifeSpecs.lifeSpecifications)
                    suggestions["alcohol"] = "Drinking too much alcohol can permanently scar and damage the liver, resulting in an increased risk of liver cancer. If you cut back on drinking fewer nights per week and one less drink per night, you could add \(yearsToAdd) years to your life! Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
                    case "atLeastThreeDrinksPerNightSelected":
                    let yearsToAdd = LifeExpectancyCalculator.alcoholImpactNumDrinks(lifeSpecs: LifeSpecs.lifeSpecifications)
                    suggestions["alcohol"] = "Drinking too much alcohol can permanently scar and damage the liver, resulting in an increased risk of liver cancer. If you cut back on drinking fewer nights per week and one less drink per night, you could add \(yearsToAdd) years to your life! Source: http://www.bumc.bu.edu/centenarian/the-living-to-100-life-expectancy-calculator/"
                    default:
                        suggestions.removeValue(forKey: "alcohol")
            }
        default:
            suggestions.removeValue(forKey: "alcohol")

        }
        
        
        suggestionsArray.removeAll()
        prepareArray()
    }

    static func prepareArray() {
        
        for (_, value) in suggestions {
            suggestionsArray.append(value)
        }
    }
}
