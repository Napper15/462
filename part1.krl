ruleset echo {
	meta {
		name "echo"
		description << Pico Lab Part 1 >>
		author "Michael K."
		logging on
	}

	run hello {
		select when echo hello
		send_directive("say") with
		something = "Hello World"
	}

	run message {
		select when echo message
		pre {
			input = event:attr("input")
		}
		send_directive("say") with
		something = "#{input}"
	}
}
