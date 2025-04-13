library(lme4)
library(emmeans)

# Assuming your data is in a dataframe named 'df' with columns 'day', 'latency', 'model'
# where 'model' indicates the type of model (e.g., place cell or distance cell)

# Example of creating a model to analyze the data
# Fit a linear mixed-effects model
all$model="dc"
all_pc$model="pc"
df<-rbind(all,all_pc)
model <- lmer(latency ~ day * model + (1|day), data = df)

# Summary of the model
summary(model)

# Perform pairwise comparisons between models using estimated marginal means
emm <- emmeans(model, ~ model | day)
pairs(emm)
