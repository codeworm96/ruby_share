module Logger
  def self.included(base)
    def base.add_logger(name)
      alias_method "#{name}_wrapped", name
      define_method name do |*arg, &block|
        puts "#{name} started"
        self.send "#{name}_wrapped", *arg, &block
        puts "#{name} finished"
      end
    end
  end
end

class A
  include Logger

  def f
    puts 'hello, world!'
  end

  add_logger :f
end

a = A.new
a.f
