module BaseUser
  def self.included base
    base.attr_accessible :display_name, :head
  end

  def head
    (attribute :head) || "/assets/default_head.jpg"
  end
end