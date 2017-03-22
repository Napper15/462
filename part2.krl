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
		fired {
			raise explicit event 'trip_processed'
			attibutes event:attrs()
		}
        }
	rule find_long_trips is active {
		select when explicit trip_processed
		pre {
			mlg = event:attr("mileage")
		}
		fired {
			raise explicit event "found_long_trip"
			attributes event:attrs()
			if (mlg > long_trip)
		}
	}

	rule process_long_trip {
		select when explicit found_long_trip
		send_directive("Found a long trip!")
	}
}

