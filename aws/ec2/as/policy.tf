resource "aws_autocaling_policy" "avg_cpu_scaling" {
  name = "avg_cpu_scaling"
  autoscaling_group_name = aws_autoscaling_group.example.name
    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 20.0
  }
  estimated_instance_warmup = 180
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "terramino_scale_down"
  autoscaling_group_name = aws_autoscaling_group.terramino.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 120
}

resource "aws_cloudwatch_metric_alarm" "scale_down" {
  alarm_description   = "Monitors CPU utilization for Terramino ASG"
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]
  alarm_name          = "terramino_scale_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  threshold           = "10"
  evaluation_periods  = "2"
  period              = "120"
  statistic           = "Average"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.terramino.name
  }
}
