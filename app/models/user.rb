class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams, through: :team_roles
  has_many :team_roles
  has_many :matches, through: :teams


  def role_on_team(team)
    self.team_roles.where(team_id: team.id).first.role
  end

end
