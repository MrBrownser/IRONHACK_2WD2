# OC1. The Lexiconomitron

# We are going to create an awesome class called Lexiconomitron. This class is the goddamn master when it comes to phrases, words, and
# this kind of stuff, and it has a Ruby interface so we can speak to IT. The only downside to this class is one thing: it loves T letters,
# so it devores them. If it has to return, let’s say “trigonometry”, it only gives “rigonomery” back.

# One of the methods of this Ruby interface is one called “shazam”. It takes an array of words (for example [“This”, “is”, “a”, “boring”,
# “test”]). With this array, it reverses the letters within the words (that is, [“sihT”, “si”, “a”, “gnirob”, “tset”]) and ends up returning the first and last. But Lexiconomitron eats T letters, so it returns [“sih, “se”].

# Another method of Lexiconomitron is called “oompa_loompa”. Also taking an array of words (boy, it loves words), lets say for example
# [“if”, “you”, “wanna”, “be”, “my”, “lover”], it takes the ones which size is three characters of less in the same order, so: [“if”, you”,
# “be”, “my”]. After passing the eat-all-t-letters filter, it’s… the same!

# The third method will be called "all_in_line". This will take an array of words and a string X, sort them from longer to shorter,
# and then print them all in a string, using the X string as the delimiter. For example, if we pass ["words", "are", "tremendously", "nice"] and
# "$" as a separator, it will print: "tremendously$words$nice$are". And yes, Lexiconomitron is still hungry and will eat all your Ts.

# The final method is called “supercounter”. Taking (as you might imagine) ¡an array of words!, it returns the number of letters, within
# all those words, that appear before “t” in the alphabet. For example, given [“I”, “am”, “getting”, “tired”, “of”, “your”, “words”],
# it would return 20.

# Using RSpec and TDD, write some tests for this class, for all three methods, exploring different scenarios and spec data.

# And remember that Lexiconomitron devores T letters!

class Lexiconomitron
	def shazam(string_arr)
		string_arr.map! { |word| word.reverse }
		string_out = [string_arr.first, string_arr.last]
		string_out = remove_tees(string_out)
	end

	def oompa_loompa(string_arr)
		remove_tees(string_arr.select { |word| word.length < 4 })
	end

	def all_in_line(string_arr, string)
	end

	def supercounter(string_arr)
	end

	def remove_tees(string_arr)
		string_arr.map { |word| word.gsub("t", "").gsub("T", "") }
	end
end