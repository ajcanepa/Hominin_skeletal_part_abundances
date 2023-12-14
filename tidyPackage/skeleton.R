#' Skeleton Data Frame
#'
#' A dataset containing the count of each skeletal part in a single human skeleton.
#' @format A data frame with 32 rows and 2 variables:
#' \describe{
#'   \item{Elements}{The name of the skeletal element.}
#'   \item{One_Skeleton}{The number of each element in one skeleton.}
#' }
"skeleton"


## in package create with "devtools::document()" the Rd file. 


#
# Create the skeleton data
# skeleton <- data.frame(
#  Elements = c("Cranium", "Mandible", "Maxillae", "Hyoid", "Atlas (C1)", "Axis (C2)",
#               "Cervical (C2-C7)", "Cervical total", "Thoracic", "Lumbar", "Sacrum", 
#               "Coccyx", "Sternum", "Clavicle", "Rib", "Scapula", "Humerus", "Radius", 
#               "Ulna", "Carpals", "Metacarpal", "Hand phalanx", "Hand (metacarpals + manual phalanges)", 
#               "Innominate (Os coxa)", "Femur", "Patella", "Tibia", "Fibula", 
#               "Tarsal", "Metatarsal", "Foot phalanx", "Foot (metatarsals + pedal phalanges)"),
#  One_Skeleton = c(1, 1, 1, 1, 1, 1, 5, 7, 12, 5, 1, 1, 1, 2, 24, 2, 2, 2, 2, 16, 10, 28, 38, 2, 2, 2, 2, 2, 14, 10, 28, 38)
# )
#
#save(skeleton, file = "data/skeleton.rda")