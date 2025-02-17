trinucleotides <- c(
    "C>A:ACA", "C>A:ACC", "C>A:ACG", "C>A:ACT", "C>A:CCA", "C>A:CCC", "C>A:CCG", "C>A:CCT", "C>A:GCA", "C>A:GCC", "C>A:GCG", "C>A:GCT",
    "C>A:TCA", "C>A:TCC", "C>A:TCG", "C>A:TCT", "C>G:ACA", "C>G:ACC", "C>G:ACG", "C>G:ACT", "C>G:CCA", "C>G:CCC", "C>G:CCG", "C>G:CCT",
    "C>G:GCA", "C>G:GCC", "C>G:GCG", "C>G:GCT", "C>G:TCA", "C>G:TCC", "C>G:TCG", "C>G:TCT", "C>T:ACA", "C>T:ACC", "C>T:ACG", "C>T:ACT",
    "C>T:CCA", "C>T:CCC", "C>T:CCG", "C>T:CCT", "C>T:GCA", "C>T:GCC", "C>T:GCG", "C>T:GCT", "C>T:TCA", "C>T:TCC", "C>T:TCG", "C>T:TCT",
    "T>A:ATA", "T>A:ATC", "T>A:ATG", "T>A:ATT", "T>A:CTA", "T>A:CTC", "T>A:CTG", "T>A:CTT", "T>A:GTA", "T>A:GTC", "T>A:GTG", "T>A:GTT",
    "T>A:TTA", "T>A:TTC", "T>A:TTG", "T>A:TTT", "T>C:ATA", "T>C:ATC", "T>C:ATG", "T>C:ATT", "T>C:CTA", "T>C:CTC", "T>C:CTG", "T>C:CTT",
    "T>C:GTA", "T>C:GTC", "T>C:GTG", "T>C:GTT", "T>C:TTA", "T>C:TTC", "T>C:TTG", "T>C:TTT", "T>G:ATA", "T>G:ATC", "T>G:ATG", "T>G:ATT",
    "T>G:CTA", "T>G:CTC", "T>G:CTG", "T>G:CTT", "T>G:GTA", "T>G:GTC", "T>G:GTG", "T>G:GTT", "T>G:TTA", "T>G:TTC", "T>G:TTG", "T>G:TTT"
)

validate_cnv <- function(df) {

    if(is.null(df)){
        return(FALSE)
    }
    if(is.null(colnames(df))){
        return(FALSE)
    }
    if(length(setdiff(colnames(df), trinucleotides))!=0){
        return(FALSE)
    }
    return(TRUE)
}

validate_knownsig <- function(df) {

    if(is.null(df)){
        return(FALSE)
    }
    if(is.null(colnames(df))){
        return(FALSE)
    }
    if(is.null(rownames(df))){
        return(FALSE)
    }
    if(length(setdiff(rownames(df), trinucleotides))!=0){
        return(FALSE)
    }
    return(TRUE)
}

validate_clinical <- function(df) {

    if(is.null(df)){
        return(FALSE)
    }
    if(is.null(colnames(df))){
        return(FALSE)
    }
    if(colnames(df)[1] != "SampleID"){
        return(FALSE)
    }
    return(TRUE)
}

validade_samples <- function(df, sigs) {
    if(length(setdiff(sigs$SignExposures@samples, df$SampleID))!=0){
        return(FALSE)
    }
    return(TRUE)
}