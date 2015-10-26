#!/usr/bin/env ruby

class Foo
  def initialize
    @attr = "baz"
  end

  def get_attr
    attr
  end
end

class Bar
  attr_reader :attr

  def initialize
    @attr = "baz"
  end

  def get_attr
    attr
  end
end

my_foo = Foo.new
my_foo.get_attr

my_bar = Bar.new
my_bar.get_attr
