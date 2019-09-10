/// @description Collision with trigger

// Destroy the trigger instance and begin a define timeline.
timeline_index = other.timeline;
timeline_running = 1;
timeline_position = 0;
instance_destroy(other);