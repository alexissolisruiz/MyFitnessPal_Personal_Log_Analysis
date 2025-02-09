-- Retrieve all columns from numbers table
select * from numbers;

-- select * from [viewname];

-- Daily Calorie Intake 
-- This query calculates the total number of calories consumed each day
create view DailyCalorieIntake as
select Date, sum(Calories) as TotalCalories
from numbers
group by Date;

-- Daily Macronutrient Breakdown
-- This query calculates total protein, carbs, and fats consumed each day
create view DailyMacronutrientBreakdown as
select Date, 
sum(Protein) as 'TotalProtein (g)', 
sum(Carbohydrates) as 'TotalCarbohydrates (g)', 
sum(Fat) as 'TotalFat (g)'
from numbers 
group by Date;

-- High Sugar Days
-- This query returns dates with excess sugar per meal (personal threshold of 40 g)
create view HighSugarDays as
select Date, sum(Sugar) as TotalSugar
from numbers
group by Date
having TotalSugar > 40;

-- Protein to Carbohydrates Ratio
-- This query calculates the ratio of protein to carbs consumed each day, excluding days with no entry
-- (higher the %, the more protein eaten compared ro carbs)
create view ProteinToCarbohydrates as
select Date, 
sum(Protein)/sum(Carbohydrates) as ProteinToCarbRatio
from numbers
group by Date
having ProteinToCarbRatio is not null;

-- Calorie Intake Range Analysis
-- This query identifies dates where calorie intake is within target range (1900 to 2100)
create view CalorieIntakeRange as
select Date, sum(Calories) as TotalCalories
from numbers
group by Date
having TotalCalories between 1900 and 2100;

-- Meal-wise Calorie Breakdown
-- This query calculates total calories consumed per meal type (Breakfast, Lunch, Dinner, Snacks) each day
CREATE VIEW MealWiseCalorieBreakdown AS
SELECT Date, Meal, SUM(Calories) AS TotalCalories
FROM numbers
GROUP BY Date, Meal;

-- High Calorie Days
-- This query identifies dates where calories consumed were higher than target calories
create view HighCalorieDays as
select Date, sum(Calories) as TotalCalories
from numbers
group by Date
having TotalCalories > 2200;

-- Low Calorie Days
-- This query identifies dates where calories consumed were lower than target calories
CREATE VIEW LowCalorieDays AS
SELECT Date, SUM(Calories) AS TotalCalories
FROM numbers
GROUP BY Date
HAVING TotalCalories < 1800;