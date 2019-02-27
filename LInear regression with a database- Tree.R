install.packages('ggplot2')
install.packages('GGally')
install.packages('scatterplot3d')
summary(trees)
str(trees)
data(trees)
head(trees)
ggpairs(trees,columns=1:3,title='Three Database')
ggpairs(trees,title='Tree database',mapping = aes(color = 'Relation'))

## Identiying the relationship between a response variable or interest and one or more predictor(Cause and effect)

reg = lm(Volume ~ Girth,data=trees)
summary(reg)

ggplot(data=trees, aes(reg$residuals)) + 
  geom_histogram(binwidth = 1, color = "black", fill = "lightgreen") +
  theme(panel.background = element_rect(fill = "lightyellow"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Histogram for Model Residuals") 


ggplot(data = trees, aes(x = Girth, y = Volume)) + geom_point()  +
  stat_smooth(method = "lm", col = "black") +
  theme(panel.background = element_rect(fill = "lightyellow"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Linear Regression Model Fitted to Data")


##Prediction

predict(reg,data.frame(Girth =18.2))

