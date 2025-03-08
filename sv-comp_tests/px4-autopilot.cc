// https://www.cvedetails.com/cve/CVE-2021-46896/
// repository: https://github.com/PX4/PX4-Autopilot
// commit: 31a599f
// extract of: src/modules/mavlink/mavlink_receiver.cpp (function: handle_message_trajectory_representation_waypoints)

#include <stdio.h>
#include <stdint.h>

struct trajectory_waypoint_s {
	int32_t number;
};

struct vehicle_trajectory_waypoint_s {
  struct trajectory_waypoint_s waypoints[5];
};


int main(int argc, char *argv[]) {
  vehicle_trajectory_waypoint_s trajectory_waypoint{};

  for (int i = 0; i < argc; ++i) {
    trajectory_waypoint.waypoints[i].number = i; // Problem: argc can be greater than 5 leading to buffer overflow of trajectory_waypoint.waypoints buffer
	}

  int32_t sum = 0;
  for (int i = 0; i < argc; ++i) {
    sum += trajectory_waypoint.waypoints[i].number;
	}

  printf("Sum of numbers is: %d\n", sum);
}
