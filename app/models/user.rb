class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#, :validatable

  has_many :teams, through: :team_roles
  has_many :team_roles
  has_many :matches, through: :teams
  has_many :goals


  def role_on_team(team)
    @roles = self.team_roles.where(team_id: team.id)
    if @roles.blank?
      "none"
    else
      @roles.first.role
    end
  end

end
