goldenRatio <- 1.618

muGrid <- seq(-10,10, length.out = 100)
sigmaGrid <- seq(.001, 5, length.out = 100)
muSigmaGrid <- expand.grid(muGrid, sigmaGrid)

makeMCFunc <- function(n = 1000){
  commonZs <- rnorm(n)
  function(params){
    stopifnot(params[2] > 0) 
    mean(sin(params[1] + params[2]*commonZs))    
  }  
}
monteCarloSinCRNv2 <- makeMCFunc()


mcApproxCRNv2 <- matrix(apply(muSigmaGrid, 1, monteCarloSinCRNv2), 
                        ncol = length(muGrid))


ht <- 5
png("front_cover.png", units="in", width=ht*goldenRatio, height=ht, res=300)
par(mfrow=c(1,2))
contour(muGrid, sigmaGrid, mcApprox, 
        xlab = expression(mu), ylab = expression(sigma))
contour(muGrid, sigmaGrid, mcApproxCRNv2, 
        xlab = expression(mu), ylab = expression(sigma))
par(mfrow=c(1,1))
# insert ggplot code
dev.off()

