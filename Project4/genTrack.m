% Track information
radius = 200;                                           % Radius of curved sections
straight_length = 900;                                  % Length of straightaway sections
track_length = 2 * (pi * radius) + 2 * straight_length; % Total track length
track_width = 15;                                       % Width of the track
% Path/track structure used in racestat functions
path.radius = 200;
path.width = 15;
path.l_st = 900;
% Waypoints setup
num_waypoints = 100;                    % Number of waypoints
delta_s = track_length / num_waypoints; % Change in distance between waypoints

% Initialize arrays for waypoints
track_x = zeros(1, num_waypoints);
track_y = zeros(1, num_waypoints);
theta = zeros(1, num_waypoints);

% Loop to generate track
for i = 1:num_waypoints
    s = i * delta_s; % Current distance along the track
    % Update waypoints based on track sections
    if s <= straight_length
        track_x(i) = s;
        track_y(i) = 0;
        theta(i) = 0;
    elseif s <= straight_length + pi * radius
        % Curved section 1
        delta_theta = (s - straight_length) / radius;
        [track_x(i), track_y(i)] = rotate(0, radius, delta_theta);
        track_x(i) = track_x(i) + straight_length;
        track_y(i) = (track_y(i) - radius)*-1;
        theta(i) = delta_theta;
    elseif s <= 2 * straight_length + pi * radius
        % Straightaway 2
        track_x(i) = straight_length - (s - straight_length - pi * radius);
        track_y(i) = 2*radius;
        theta(i) = pi;
    else
        % Curved section 2
        delta_theta = (s - 2 * straight_length - pi * radius) / radius;
        [track_x(i), track_y(i)] = rotate(0, -radius, delta_theta);
        track_y(i) = (-radius + track_y(i))*-1;
        theta(i) = delta_theta+pi;
    end
end

% Completes track
track_x(end) = track_x(1);
track_y(end) = track_y(1);
theta(end) = theta(1);

track_waypoints = [transpose(track_x), transpose(track_y)];

% Rotation function for curved sections
function [x_rot, y_rot] = rotate(x, y, theta)
    R = [cos(theta), sin(theta); -sin(theta), cos(theta)];
    xy_rot = R * [x; y];
    x_rot = xy_rot(1);
    y_rot = xy_rot(2);
end

% Same rotation function in demo folder is used for car patch rotation
function rotated_xy = rotatecar(xy, theta)
    R = [cos(theta), sin(theta); -sin(theta), cos(theta)];
    rotated_xy = R * xy;
end