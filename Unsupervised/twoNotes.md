MNI

MNE

MAU

MNAU

%MAU

%MNAU

ReMNAU
$$
\text{ReMAUI} & =||\text{MAUI} ||_1 =\text{Manhatten-Norm}(\frac{\text{MAU}}{\text{max(MNI)}}) \\ \\

&  = \frac{ \frac{MAU}{max(MNE)}}{\sum \frac{MAU}{max(MNE)}} 
     = \frac{MAU}{\sum MAU}
   = \frac{ \frac{MAU}{max(MNI)}}{\sum \frac{MAU}{max(MNI)}} \\ \\
   & = \frac{MNAU}{\sum MNAU} =||MNAU||_1 = ReMNAU
$$


-----





## Cluster analysis 





Next steps: compare clustering results. 

### Outlier detection 



### LDA 



### Feature correlation 



----

Papers: 

1) Origin of SH 
2) Coparetive study of very small datasets
3) Clustering in ... highly biased and must be reevaluated
4) Package PartAbunance





----

need baseline !!!

ask when its comparable and when not 

what and when anomaly detection

for each of data set / for each dimReduction (ask which) / for each Selection / 

what scores vs metrics/ for table  and for grid search

evaluate best with SH in the fold. 

what cluster algos and why 

-----

**list algos:** K-means(stats/(iter.max, nstart, algos, k)), Mean shift, GMM, Affinity Propagation, clara(cluster/ metric, samples, samplesize, rngR), hclust(cluster/metric, method, per.method), EM(mclust/z, modelName), hcmodel(mclust/ modelName, use), spectral (kernlab/kernel, kpar, iter, mod.simple), subspace(hdclassif), optics(dbscan/eps, minPts), dbscan(dbscan/eps, minPts, Xi)

**list metrics:** The Jaccard Index (J), Adjusted Rand Index (ARI) and Fowlkes Mallows (FM), sider the normalized mutual information (NMI), Dunn’s validation index, silhouette, accuracy *2 (+F1)

**list dimReduc:** Principal Component Analysis (PCA), Linear Discriminant Analysis (LDA) (labels), PARTIAL LEAST SQUARES pls, INDEPENDENT COMPONENT ANALYSIS ICA,  UNIFORM MANIFOLD APPROXIMATION AND PROJECTION (UMAP),t-Distributed Stochastic Neighbor Embedding (t-SNE), phate, Uniform Manifold Approximation and Projection (UMAP), Isomap (Isometric Mapping) 

list outlier:

RFE: 23 -1

----

1) baseline 
2) list of models 
3) list of hyper parametes
4) CV -> inside fold 
5) normalizing inside fold 
6) dim reduction inside fold / FI / RFE / F eng. 
7) outlier inside fold 
8) metrics / best for grid search 
9) save and applie best models with SH -> table
