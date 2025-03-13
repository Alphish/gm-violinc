if (!command.is_enabled)
    image_blend = c_gray;
else if (position_meeting(mouse_x, mouse_y, id))
    image_blend = c_yellow;
else
    image_blend = c_white;
