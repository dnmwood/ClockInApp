class ShiftsController < ApplicationController
  def index
    @shifts = current_user.shifts
  end

  def new
    @shift = Shift.new
  end

  def create
    # Note: this is set to EST, would be useful with more time to
    # set login-time to the Users current timezone.
    @shift = Shift.new(
      user_id: current_user.id,
      time_in: Time.now.in_time_zone('Eastern Time (US & Canada)')
      )
    start_shift(@shift)
  end

  def start_shift(shift)
    if shift.save
      current_user.clocked_in = true
      current_user.save
      redirect_to root_url
    else
      render :new
      flash[:alert] = "Unable to start shift."
     end
  end

  def clock_out
    # Note: Same as mentioned on line 13
    @shift = current_user.shifts.all.last
    @shift.time_out = Time.now.in_time_zone('Eastern Time (US & Canada)')
    end_shift(@shift)
  end

  def end_shift(shift)
    if shift.save
      current_user.clocked_in = false
      current_user.save
      redirect_to root_url
    else
      flash[:alert] = "Unable to clockout."
    end
  end
end
