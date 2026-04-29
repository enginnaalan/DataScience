getwd()

df <- read.csv("insurance.csv")

erkek <-df[df$sex=="male",]

kadin <-df[df$sex=="female",]

View(kadin)

View(erkek)

library(tidyverse)

plot_age_dagilim <-ggplot (df,aes(x= age))+
  geom_histogram(binwidth = 5,
                 fill="pink",
                 color="red",
                 alpha=0.8)+
  labs(title="yaş dağılımı",
       x="yaş",
       y="kişi sayısı")+
  theme_light()

plot_age_dagilim

plot_bmi_hist <-ggplot (df,aes(x=bmi))+
  geom_histogram(binwidth = 2,
                 fill="orange",
                 color="red",
                 alpha=0.8)+
  labs(title="vücut kitle index (vki) dağılımı",
       x="vki",
       y="kişi sayısı")+
  theme_light()

plot_bmi_hist




plot_children_hist <-ggplot (df,aes(x=children))+
  geom_histogram(binwidth = 1,
                 fill="blue",
                 color="red",
                 alpha=0.8)+
  labs(title="çocuk sayısı dağılım grafiği",
       x="çocuk sayısı",
       y="kişi sayısı")+
  theme_light()

plot_children_hist



plot_expenses_hist <-ggplot (df,aes(x=expenses))+
  geom_histogram(binwidth = 5000,
                 fill="yellow",
                 color="black",
                 alpha=0.8)+
  labs(title="maliyet dağılım",
       x="maliyetler($)", y="kişi sayısı")+
  theme_light()

plot_expenses_hist

install.packages("patchwork")

library(patchwork)

(plot_age_dagilim + plot_bmi_hist)/
  (plot_children_hist + plot_expenses_hist)

plot_sex_bar <- ggplot(df, aes(x = smoker, fill = sex)) + 
  geom_bar() +
  labs(title = "cinsiyet dağılımı",
       x = "cinsiyet",
       y = "kişi sayısı") +
  theme_light() +
  theme(legend.position = "none")

plot_smoker_bar

#smoking distributon
Sys.setlocale("LC_ALL","tr_TR.UTF-8")

plot_smoker_bar <- ggplot (df,aes(x = smoker, fill = smoker))+
  geom_bar()+
  scale_fill_manual(values = c(
    "no" = "#2ca02c",
    "yes" = "#d62728"
  ))
labs(title="sigara icme durumu",x="sigara iciyormu",y="Kisi Sayısı ")+
  theme_light()+
  theme(legend.position = "none")

plot_smoker_bar

plot_region_bar <- ggplot(df, aes(x = region, fill = region)) +
  geom_bar() +
  scale_fill_manual(values = c(
    "southwest" = "blue",
    "southeast" = "orange",
    "northwest" = "green",
    "northeast" = "purple"
  )) +
    
    labs(title = "Bölgelere Göre Dağılım",
          x = "Bölge",
          y = "Kişi Sayısı"
    ) +
  theme_light() +
  theme(legend.position = "none")
plot_region_bar

(plot_sex_bar+ plot_smoker_bar)/
  (plot_region_bar)