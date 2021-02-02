function resetHeading(this)
% RESETHEADING Reset the heading of the RVR
    this.drive_control_m.Command    = 'reset_heading';
    
    sendGoal(this.drive_control_ac, this.drive_control_m);
end

