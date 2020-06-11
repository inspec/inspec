# This class represents a Docker Event.
class Docker::Event
  include Docker::Error

  # Represents the actor object nested within an event
  class Actor
    attr_accessor :ID, :Attributes

    def initialize(actor_attributes = {})
      [:ID, :Attributes].each do |sym|
        value = actor_attributes[sym]
        if value.nil?
          value = actor_attributes[sym.to_s]
        end
        send("#{sym}=", value)
      end

      if self.Attributes.nil?
        self.Attributes = {}
      end
    end

    alias_method :id, :ID
    alias_method :attributes, :Attributes
  end

  class << self
    include Docker::Error

    def stream(opts = {}, conn = Docker.connection, &block)
      conn.get('/events', opts, :response_block => lambda { |b, r, t|
        block.call(new_event(b, r, t))
      })
    end

    def since(since, opts = {}, conn = Docker.connection, &block)
      stream(opts.merge(:since => since), conn, &block)
    end

    def new_event(body, remaining, total)
      return if body.nil? || body.empty?
      json = Docker::Util.parse_json(body)
      Docker::Event.new(json)
    end
  end

  attr_accessor :Type, :Action, :time, :timeNano
  attr_reader :Actor
  # Deprecated interface
  attr_accessor :status, :from

  def initialize(event_attributes = {})
    [:Type, :Action, :Actor, :time, :timeNano, :status, :from].each do |sym|
      value = event_attributes[sym]
      if value.nil?
        value = event_attributes[sym.to_s]
      end
      send("#{sym}=", value)
    end

    if @Actor.nil?
      value = event_attributes[:id]
      if value.nil?
        value = event_attributes['id']
      end
      self.Actor = Actor.new(ID: value)
    end
  end

  def ID
    self.actor.ID
  end

  def Actor=(actor)
    return if actor.nil?
    if actor.is_a? Actor
      @Actor = actor
    else
      @Actor = Actor.new(actor)
    end
  end

  alias_method :type, :Type
  alias_method :action, :Action
  alias_method :actor, :Actor
  alias_method :time_nano, :timeNano
  alias_method :id, :ID

  def to_s
    if type.nil? && action.nil?
      to_s_legacy
    else
      to_s_actor_style
    end
  end

  private

  def to_s_legacy
    attributes = []
    attributes << "from=#{from}" unless from.nil?

    unless attributes.empty?
      attribute_string = "(#{attributes.join(', ')}) "
    end

    "Docker::Event { #{time} #{status} #{id} #{attribute_string}}"
  end

  def to_s_actor_style
    most_accurate_time = time_nano || time

    attributes = []
    actor.attributes.each do |attribute, value|
      attributes << "#{attribute}=#{value}"
    end

    unless attributes.empty?
      attribute_string = "(#{attributes.join(', ')}) "
    end

    "Docker::Event { #{most_accurate_time} #{type} #{action} #{actor.id} #{attribute_string}}"
  end
end
