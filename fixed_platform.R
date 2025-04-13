library(dplyr)
all_summary <- all %>%
  group_by(day) %>%
  summarize(
    mean_latency = mean(latency, na.rm = TRUE),
    se_latency = sd(latency, na.rm = TRUE) / sqrt(n()),
    
    mean_dist = mean(dist, na.rm = TRUE),
    se_dist = sd(dist, na.rm = TRUE) / sqrt(n()),
    
    mean_target_quadrant = mean(target_quadrant, na.rm = TRUE),
    se_target_quadrant = sd(target_quadrant, na.rm = TRUE) / sqrt(n()),
    
    mean_opposite_quadrant = mean(opposite_quadrant, na.rm = TRUE),
    se_opposite_quadrant = sd(opposite_quadrant, na.rm = TRUE) / sqrt(n()),
    
    mean_wall_zone = mean(wall_zone, na.rm = TRUE),
    se_wall_zone = sd(wall_zone, na.rm = TRUE) / sqrt(n())
  )

all_pc_summary <- all_pc %>%
  group_by(day) %>%
  summarize(
    mean_latency = mean(latency, na.rm = TRUE),
    se_latency = sd(latency, na.rm = TRUE) / sqrt(n()),
    
    mean_dist = mean(dist, na.rm = TRUE),
    se_dist = sd(dist, na.rm = TRUE) / sqrt(n()),
    
    mean_target_quadrant = mean(target_quadrant, na.rm = TRUE),
    se_target_quadrant = sd(target_quadrant, na.rm = TRUE) / sqrt(n()),
    
    mean_opposite_quadrant = mean(opposite_quadrant, na.rm = TRUE),
    se_opposite_quadrant = sd(opposite_quadrant, na.rm = TRUE) / sqrt(n()),
    
    mean_wall_zone = mean(wall_zone, na.rm = TRUE),
    se_wall_zone = sd(wall_zone, na.rm = TRUE) / sqrt(n())
  )

all_pc_summary$type<-"place cells"
all_summary$type<-"distance cells"
pc_dc<-rbind(all_pc_summary,all_summary)

# latency
pc_dc %>%
  ggplot(aes(x = day, y = mean_latency, fill = type)) +
  geom_line(aes(group = type, color = type), size = 1,na.rm = F) +
  geom_errorbar(
    aes(ymin = mean_latency - se_latency, ymax = mean_latency + se_latency, color = type), 
    width = 0.1
  ) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "PC and DC models on fixed platforms", x = "Day", y = "Latency (s)") +
  scale_x_continuous(breaks = 1:8)+
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(hjust = 0.5))

# Wall Zone Time
pc_dc %>%
  ggplot(aes(x = day, y = mean_wall_zone, fill = type)) +
  geom_line(aes(group = type, color = type), size = 1,na.rm = F) +
  geom_errorbar(
    aes(ymin = mean_wall_zone - se_wall_zone, ymax = mean_wall_zone + se_wall_zone, color = type), 
    width = 0.1
  ) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "PC and DC models on fixed platforms", x = "Day", y = "Wall Zone Time (%)") +
  scale_x_continuous(breaks = 1:8)+
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(hjust = 0.5))


# Opposite quadrant time
pc_dc %>%
  ggplot(aes(x = day, y = mean_opposite_quadrant, fill = type)) +
  geom_line(aes(group = type, color = type), size = 1,na.rm = F) +
  geom_errorbar(
    aes(ymin = mean_opposite_quadrant - se_opposite_quadrant, ymax = mean_opposite_quadrant + se_opposite_quadrant, color = type), 
    width = 0.1
  ) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "PC and DC models on fixed platforms", x = "Day", y = "Opposite quadrant Time (s)") +
  scale_x_continuous(breaks = 1:8)+
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(hjust = 0.5))

pc_dc %>%
  ggplot(aes(x = day, y = mean_target_quadrant, fill = type)) +
  geom_line(aes(group = type, color = type), size = 1,na.rm = F) +
  geom_errorbar(
    aes(ymin = mean_target_quadrant - se_target_quadrant, ymax = mean_target_quadrant + se_target_quadrant, color = type), 
    width = 0.1
  ) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "PC and DC models on fixed platforms", x = "Day", y = "Target Quadrant Time (s)") +
  scale_x_continuous(breaks = 1:8)+
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(hjust = 0.5))
