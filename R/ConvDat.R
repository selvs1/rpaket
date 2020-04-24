#' convDat Funktion
#'
#' @description Converts all columns of a data frame with type X to type Y.
#' @param inputDF A data.frame
#' @param searchType Type of the columns which have to be converted.
#' @param targetType Type to which the columns with type "searchType" will be converted
#' @return a data.frame with column types converted
#' @export
#' @examples \dontrun{convDat(iris, is.factor, as.character)}

convDat <- function(inputDF, searchType, targetType) {

  searchTypeList <- list(is.character, is.double, is.factor, is.integer, is.numeric, is.logical)
  targetTypeList <- list(as.character, as.double, as.factor, as.integer, as.numeric, as.logical)
  # Check correct input
  if (!is.data.frame(inputDF)) {stop("inputDF is not a data.frame.")}

  bool <- FALSE
  for(i in searchTypeList) {
    bool <- bool | identical(searchType, i)
  }

  if (!bool)
    stop("Wrong searchTypeList! Choose one of: is.character, is.double, is.factor, is.integer, is.numeric, is.logical.")

  bool <- FALSE
  for(i in targetTypeList) {
    bool <- bool | identical(targetType, i)
  }

  if (!bool)
    stop("Wrong targetTypeList! Choose one of: as.character, as.double, as.factor, as.integer, as.numeric, as.logical.")

  # Check wrong combinations
  # character --> numeric
  if(identical(searchType, is.character) && identical(targetType, as.numeric))
    warning("Converting character to numeric is dangerous and leads to NAs!")
  if(identical(searchType, is.numeric) && identical(targetTyp, as.logical))
    warning("Do you really want numbers to be converted to logical values, where everything except 0 is TRUE? You cannot switch back!")

  indx <- sapply(inputDF, searchType)
  inputDF[indx] <- lapply(inputDF[indx], function(x) targetType(x))

  return(inputDF)
}



### use_r("ConvDat.R")
