import rand
import os

fn main() {
	passgen()
}

fn passgen() {
	passlength := (os.input('Length of password: ').int())
	char := 'abcdefghijklmnopqrstuvwxyz'
	charupper := char.to_upper()
	num := '1234567890'
	symbols := '!@#$%^&*()_+'

	if passlength == 0{
		println('The input you have entered contains chars!')
	}
	else{
		println(rand.string_from_set(char + charupper + num + symbols, passlength))
	}
}
