-- Retrieve all columns from numbers table
select * from numbers;

-- Find dates of the year where calories were above
-- or below my goal calories intake
select Date, Meal, Calories
from numbers
where calories > 2200 or calories < 1500;

-- Locate dates with excess sugar per meal
select Date, Meal, Sugar, Calories
from numbers
where sugar > 40;

-- Sum of calories consumed each day across all meals
select Date, sum(Calories) as Calories
from numbers
group by Date;

-- Find total number of specific macronutrients each day
-- (protein, carbohydrates, fat)
select Date, sum(Protein) as 'Protein (g)', sum(Carbohydrates) as 'Carbohydrates (g)', sum(Fat) as 'Fat (g)'
from numbers 
group by Date;

-- Trends of calories over specific range of calories
select Date, Calories
from numbers
where Calories between 1800 and 2200;

-- Ratio of protein to carbohydrate intake (higher the %, the more protein eaten compared ro carbs)
select Date, (Protein/Carbohydrates) as ProteinToCarbRatio
from numbers
where (Protein/Carbohydrates) is not null;
