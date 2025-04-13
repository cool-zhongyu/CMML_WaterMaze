# Comparsion of place cell model and distance cell model

## Objectives
1. comparing simulation results and cognitive maps produced by a place cell-based reinforcement learning model with the one that includes distance cells that are sensitive to distance to the wall; 
2. testing if and when the place cell-based model can outperform the distance cell-based model in the variable platform location task; 
3. testing if and when the distance cell-based model can outperform the place cell-based model in the standard (fixed platform location) task;
## Tips for objectives
### Objective 1
running distance-cell_model_cognitive_map.R and place-cell_model_cognitive_map.R for producing picture results


### Objective 2 and 3
1. For fixed platform, set the variable variable_platform to 0. For variable platform, set to 1
```r
variable_platform <- 0 #the platform is variable - 1, the platform is fixed - 0

2. Running distance-cell model.R and place-cell model.R two files
3. Running fixed_platform.R or variable_platform.R to produce result pictures
4. for statiscal analysis, choose the expected metric for analysis and running stastic_analysis.R file. For example, latency
```r
model <- lmer(latency ~ day * model + (1|day), data = df)
