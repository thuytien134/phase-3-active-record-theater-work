class Role < ActiveRecord::Base
    has_many :auditions
def actors
self.auditions.pluck(:actor)
end
def locations
self.auditions.pluck(:location)
end
def lead

 if self.auditions.where('auditions.hired = true').count >0
    self.auditions.where('auditions.hired = true').first
 else
    return 'no actor has been hired for this role'
 end

end
def understudy
    if self.auditions.where('auditions.hired = true').count >1
        self.auditions.where('auditions.hired = true').second
     else
        return 'no actor has been hired for understudy for this role'
     end
end
end