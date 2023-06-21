#!/bin/bash

# function using API
get_weather_info(){
    api_key="API_KEY"
    city="$1"

    # Calling API
    weather_data=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api_key")
    temperature=$(echo "$weather_data" | jq '.main.temp')
    humidity=$(echo "$weather_data" | jq '.main.humidity')
    weather_description=$(echo "$weather_data" | jq -r '.weather[0].description')

    # Print information
    echo "Weather in $city:"
    echo "Temperature: $temperature K"
    echo "Humidity: $humidity %"
    echo "Description: $weather_description" 
}

echo "1. Get Weather Information"
echo "2. Exit"
read -p "Enter your choice: " choice

case $choice in 
1)
    read -p "Enter the city name: " city
    get_weather_info $city
    ;;

2)
    echo "invalid choice"
    ;;
esac