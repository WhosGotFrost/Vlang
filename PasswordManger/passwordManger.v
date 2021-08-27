import os
import term
import funcs

fn main(){
	main_menu()
}

fn check_file(){
	if os.exists('passManager.txt'){
		return
	}
	else {
		mut file := os.open_file('passManager.txt', 'w') or { panic('Could not create file passwordManager.txt file.') }
		file.close()
	}
}

fn append_new() {
	mut file := os.open_file('passManager.txt', 'a') or { panic('Could not edit file!') }

	username := os.input('Please enter Username: ')
	password := os.input('Enter Password: ')
	website:= os.input('Enter Website: ')

	user := 'username: ${username} \n'
	pass := 'password: ${password} \n'
	web := 'website: ${website} \n'

	file.writeln(user) or { panic('unable to edit file') }
	file.writeln(pass) or { panic('unable to edit file') }
	file.writeln(web) or { panic('unable to edit file') }
	file.writeln('=========================') or { panic('unable to edit file') }
	file.close()
}

fn read_password(){
	mut file := os.read_file('passManager.txt')  or { panic('could not open file') }
	println(file)
}


fn delete_password_file(){
	rgb := term.rgb(3,252,165, term.bold(os.hostname() + '@Menu'))
	user_input := os.input('${rgb} ==> Are you sure you would like to clear your file? [Y/N]: ')

	if user_input == 'Y' || user_input == 'y'{
		os.rm('passManager.txt') or { panic('could not remove file') }
		mut file := os.open_file('passManager.txt', 'w') or { panic('could not create file.') }
		file.close()
	}
	else{
		exit(1)
	}
}

fn back(){
	clear()
	main_menu()
}

fn clear(){
	term.clear()
}

fn main_menu(){
	funcs.banner()
	rgb := term.rgb(3,252,165, term.bold(os.hostname() + '@Menu'))
	menu := os.input('${rgb} ==> Enter a number from the Menu or exit: ')

	if menu == '1'{
		check_file()
		append_new()
		back()
	}
	else if menu == '2'{
		read_password()
		user_input := os.input('${rgb} ==> Would you like to go back to the menu: [Y/N]: ')
		if user_input == 'Y' || user_input == 'y'{
			back()
		}
		else{
			exit(1)
		}
	}
	else if menu == '3'{
		clear()
		delete_password_file()
		back()
	}
	else if menu == 'exit'{
		exit(1)
	}
	else{
		main_menu()
	}
}