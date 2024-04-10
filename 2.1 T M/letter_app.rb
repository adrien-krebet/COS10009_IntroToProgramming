require './input_functions' 
 
# takes in the name details from the terminal and returns the formatted strings
def read_name()
	title = read_string("Please enter your title: (Mr, Mrs, Ms, Miss, Dr)")
	first_name = read_string("Please enter your first name:")
	last_name = read_string("Please enter your last name:")
	return ("#{title} #{first_name} #{last_name}\n")
end

# takes in the address details from the terminal returns the formatted strings
def read_address()
	unit_num = read_string("Please enter the house or unit number:")
	street = read_string("Please enter the street name:")
	suburb = read_string("Please enter the suburb:")
	postcode = read_integer_in_range("Please enter a postcode (0000 - 9999)", 0000, 9999).to_s()
	return ("#{unit_num} #{street}\n#{suburb} #{postcode}")
end

# combines name and address details into one label function
def read_label()
	full_name = read_name
	full_address = read_address
	return full_name+full_address
end

# takes in the message details from the terminal returns the formatted strings
def read_message()
	subject_line = read_string("Please enter your message subject line:")
	message_content = read_string("Please enter your message content:")	
	return ("RE: " + subject_line + "\n\n" + message_content + "\n")
end

# sets up procedure for printing the label and message data
def print_all(label, message)
	puts(label)
	puts(message)
	return
end

#gets name and message functions to print to console
def main()
	name=read_label
	message=read_message
	print_all(name, message)
end

#calls main function to run
main()