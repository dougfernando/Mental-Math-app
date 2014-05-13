def rnd(min,max)
	rand(max+1-min) + min
end

SERIES = 120
# GitHub test
def easy_add
	(1..SERIES).each {
		a = rnd(1,20)
		b = rnd(1,20)
		puts "EASY ADD " + a.to_s + " + " + b.to_s + " = " + (a+b).to_s
	}
end

def easy_sub
	(1..SERIES).each {
		a = rnd(1,40)
		b = rnd(1,a)
		puts "EASY SUB " + a.to_s + " - " + b.to_s + " = " + (a-b).to_s
	}
end

def easy_mul
	(1..SERIES).each {
		a = rnd(1,10)
		b = rnd(1,10)
		puts "EASY MULTIP " + a.to_s + " * " + b.to_s + " = " + (a*b).to_s
	}
end


def easy_div
	(1..SERIES).each {
		b = rnd(1,10)
		a = rnd(1,10) * b
		puts "EASY DIV " + a.to_s + " / " + b.to_s + " = " + (a/b).to_s
	}
end

def easy_perc
	(1..SERIES).each {
		a = rnd(1,9)*10
		b = rnd(1,10) * 10
		puts "EASY PERC " + a.to_s + " %  " + b.to_s + " = " + (a*b/100).to_s
	}
end

def medium_add
	(1..SERIES).each {
		a = rnd(1,100)
		b = rnd(1,100)
		puts "MEDIUM ADD " + a.to_s + " + " + b.to_s + " = " + (a+b).to_s
	}
end

def medium_sub
	(1..SERIES).each {
		a = rnd(1,200)
		b = rnd(1,a)
		puts "MEDIUM SUB " + a.to_s + " - " + b.to_s + " = " + (a-b).to_s
	}
end

def medium_mul
	(1..SERIES).each {
		a = [1,10,100][rnd(0,2)]*rnd(1,20)
		b = [1,10,100][rnd(0,2)]*rnd(1,20)
		puts "MEDIUM MULTIP " + a.to_s + " * " + b.to_s + " = " + (a*b).to_s
	}
end


def medium_div
	(1..SERIES).each {
		b = [1,10][rnd(0,1)]*rnd(1,10)
		a = [1,10][rnd(0,1)]*rnd(1,10)
		puts "MEDIUM DIV " + (a*b).to_s + " / " + b.to_s + " = " + (a*b/b).to_s
	}
end

def medium_perc
	(1..SERIES).each {
		a = [10,20,30,40,50,60,70,80,90,25,75][rnd(0,10)]
		b = [100,1000,10000][rnd(0,2)]*rnd(1,10)
		puts "MEDIUM PERC " + a.to_s + " % " + b.to_s + " = " + (a*b/100).to_s
	}
end

def hard_add
	(1..SERIES).each {
		a = rnd(1,1000)
		b = rnd(1,1000)
		puts "HARD ADD " +a.to_s + " + " + b.to_s + " = " + (a+b).to_s
	}
end

def hard_sub
	(1..SERIES).each {
		a = rnd(1,500)
		b = rnd(1,a)
		puts "HARD SUB " + a.to_s + " - " + b.to_s + " = " + (a-b).to_s
	}
end

def hard_mul
	(1..SERIES).each {
		a = [100,1000,10000,1000000][rnd(0,3)]*rnd(1,19)
		max_factor = 9 - Math::log10(a).to_i
		# BUG
		b = (10**rnd(0,max_factor)) * rnd(1,10)
		puts "HARD MULTIP " + a.to_s + " * " + b.to_s + " = " +  ("%E" % (a*b))
	}
end


def hard_div
	(1..SERIES).each {
		b_factor = rnd(2,9)
		b = [1,10][rnd(0,1)]*b_factor

		a = b * [10000, 100000, 1000000, 10000000, 100000000][rnd(0,4)]*rnd(2,9)
		puts "HARD DIV " + a.to_s + " / " + b.to_s + " = " + ("%E" % (a/b))
	}
end

def hard_perc
	(1..SERIES).each {
		a = [10,20,30,40,50,60,70,80,90,25,75][rnd(0,10)]
		b = [10000, 100000, 1000000, 10000000, 100000000][rnd(0,4)]*rnd(1,20)
		puts "HARD PERC " + a.to_s + " % " + b.to_s + " = " + (a*b/100).to_s
	}
end

#easy_add
#easy_sub
#easy_mul
#easy_div
#easy_perc
#medium_add
#medium_sub
#medium_mul
#medium_div
#medium_perc
#hard_add
#hard_sub
hard_mul
#hard_div
#hard_perc
