ruleset track_trips_two {
        meta {
                name "track trips"
                descriptions << Part 1 Pico Track Trips >>
                author "Michael K."
                logging on
        }

        rule process_trip {
                select when car new_trip
                pre{
                        mileage = event:attr("mileage");
                }
                send_directive("trip") with
                trip_length = "#{mileage}"
        }
}

