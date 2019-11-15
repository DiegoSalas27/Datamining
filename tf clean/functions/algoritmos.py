from sklearn.cluster import KMeans

def kmeans(X, df, k):
    kmeans = KMeans(init='k-means++', n_clusters=k, n_init=10)
    kmeans.fit(X)

    dataCluster = df[['Name']]
    dataCluster["Cluster"] = kmeans.labels_