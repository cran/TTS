#' Estimates of material properties by Time-Temperature Superposition (TTS)
#' analysis
#' 
#' TTS analysis is often applied to frequency modulated data obtained by
#' Dynamic Mechanic Analysis (DMA) and Rheometry in the analytical chemistry
#' and physics areas. These techniques provide estimates of material
#' mechanical properties (such as moduli) at different temperatures in a wider
#' range of time. This package provides the Time-Temperature superposition
#' Master Curve at a referred temperature by the three methods: the two wider
#' used methods, Arrhenius based methods and WLF, and the newer methodology
#' based on derivatives procedure. The Master Curve is smoothed by B-splines
#' basis. The package output is composed of plots of experimental data,
#' horizontal and vertical shifts, TTS data, and TTS data fitted using
#' B-splines with bootstrap confidence intervals.
#' 
#' \tabular{ll}{ Package: \tab TTS\cr Type: \tab Package\cr Version: \tab
#' 1.0\cr Date: \tab 2023-02-24\cr License: \tab GPL >= 2\cr } The main
#' functions and data frame are \code{TTS}, \code{PLOT.TTS} and \code{PC}
#' 
#' @name TTS-package
#' @docType package
#' @author Antonio Meneses \email{antoniomenesesfreire@@hotmail.com}, Salvador
#' Naya \email{salva@@udc.es} and Javier Tarrio-Saavedra
#' \email{jtarrio@@udc.es}\cr
#' 
#' Maintainer: Antonio Meneses \email{antoniomenesesfreire@@hotmail.com}
#' @import mgcv
#' @import sfsmisc
#' @import splines
#' @importFrom grDevices colors
#' @importFrom graphics abline legend lines plot points
#' @importFrom stats lm predict quantile resid rnorm sd spline
#' @references Naya, S., Meneses A., Tarrio-Saavedra, J., Artiaga R.,
#' Lopez-Beceiro, J. and Gracia-Fernandez C. (2013) New method for estimating
#' shift factors in time-temperatura superposition models. Journal of Thermal
#' Analysis and Calorimetry. ISSN 1388-6150. DOI 10.1007/s10973-013-3193-1.\cr
#' 
#' Williams, M. L. (1964) Structural analysis of Viscoelastic materials. AIAA
#' Journal, 785-808.\cr
#' 
#' Zou, J., You F., Su L., Yang Z., Chen G. and Guo S. (2011). Failure
#' Mechanism of Time-Temperature Superposition for Poly(vinyl
#' chloride)/Dioctylphthalate (100/70) System. DOI 10.1002/app.35113.\cr
#' 
#' Ferry J.D. (1980) Viscoelastic Properties of Polymers, Wiley: New York.\cr
#' 
#' Artiaga R., Garcia A. Fundamentals of DMA. In: 'Thermal analysis.
#' Fundamentals and applications to material characterization' (ed.: Artiaga
#' R.) Publicaciones de la Universidade da Coruna, A Coruna, Spain, 183-206
#' (2005).\cr
#' 
#' Chartoff R.P., Menczel J.D., Dillman S.H. Dynamic mechanical analysis
#' (DMA).  In: 'Thermal analysis of polymers. Fundamentals and applications'
#' (eds.: Menczel J.D., Prime R.B.) Wiley, San Jose, 387-496 (2009).\cr
#' @keywords package
NULL




#' Dataset obtained from polycarbonate (polymer) tests using Dynamic
#' Mechanical Analysis (DMA)
#' 
#' PC contains 49 rows and 3 columns.
#' 
#' The dataset corresponds to the storage modulus viscoelastic property of
#' different specimens of polycarbonate (PC) and obtained by DMA using TA
#' Instruments Q800 (Naya et al., 2013).
#' 
#' @name PC
#' @docType data
#' @format This data frame is composed of the following columns:
#' @format A data frame with XXX observations on the following 3 variables:
#' \describe{
#'   \item{log10.frequency}{It accounts for seven different frequencies
#' (rad/s) in logarithmic scale for each temperature (overall 49).}
#' \item{log10.module}{It accounts for seven different storage
#' modulus, E' (Pa), in base-ten logarithmic scale for each temperature
#' (overall 49).}
#' \item{temperature}{Seven different temperatures:
#' 147, 148, 149, 150, 151, 152, 153 degrees celsius, each one with the
#' corresponding seven values of frequency and storage modulus (overall 49).}
#' }
#' @source Naya, S., Meneses A,. Tarrio-Saavedra, J,. Artiaga R.,
#' Lopez-Beceiro, J. and Gracia-Fernandez C. (2013) New method for estimating
#' shift factors in time-temperatura superposition models. Journal of Thermal
#' Analysis and Calorimetry. ISSN 1388-6150. DOI 10.1007/s10973-013-3193-1.
#' @keywords datasets
#' @examples
#' 
## library(TTS)
#' data(PC)
#' 
NULL

#' Dataset obtained from creep tests of an epoxy based composite by using
#' Dynamic Mechanical Thermal Analysis (DMTA)
#' 
#' Epoxy is a dataset composed of 273 rows and 3 columns that describes the
#' performance of an epoxy resin based composite in a creep type test. This
#' type of laboratory experimental procedure is defined by the application of a
#' constant stress, \eqn{\sigma}, and the measuring of the strain, \eqn{\varepsilon (t)}, 
#' or compliance, \eqn{J(t)= \varepsilon (t) / \sigma} (in the present case) as#'the response variable. 
#' The experimental tests are made by Dynamic Mechanical Thermal Analysis (DMTA)
#' technique, using a 3 point bending configuration with the following
#' features: Clamp, 3-Point Bending; Geometry, Rectangular; Size: length of 20
#' mm, width of 5.55 mm, and thickness of about 0.85 mm.
#' 
#' The dataset includes the measurements of the compliance property depending
#' on the time and corresponding to different specimens of an epoxy resin based
#' composite. All the observations were obtained by the application of the DMTA
#' experimental technique. The application of the TTS principle to creep tests
#' is becoming more and more common. Creep test provides information about the
#' deformation of a material subjected to a constant load. This test is in
#' accordance with many real applications such as the performance of shoe
#' insoles, structural materials, asphalt, etc. In this framework, TTS provides
#' the degree of the deformation of the material at an extended range of times,
#' when this material is subjected to a constant load. Therefore, TTS is
#' becoming increasingly useful in studies of material degradation and lifetime
#' estimation. The use of the TTS principle with creep tests usually provides
#' smoother master curves since each curve is usually defined by a larger
#' number of experimental observations than, for example, modulus curves as a
#' function of frequency.
#' 
#' @name Epoxy
#' @docType data
#' @format This data frame is composed of the following columns: 
#' \describe{
#' \item{Log10_time}{It accounts for 39 different times from 2 s to
#' 3599 s, in logarithmic scale for each one of the 7 studied temperatures
#' (overall 273 observations).} 
#' \item{Log10_Compliance}{It accounts for
#' 39 different values for the compliance, J (MPa-1), for each one of the 7
#' studied temperatures, in base-ten logarithmic scale. }
#' \item{Temperature}{It is the variable that shows the temperature at
#' which the measurements of compliance are experimentally obtained, namely 30,
#' 40, 50, 60, 70, 80, and 90 Celsius degrees.} }
#' @source
#' 
#' Janeiro-Arocas, J., Tarrío-Saavedra, J., López-Beceiro, J., Naya, S.,
#' López-Canosa, A., Heredia-García, N., and Artiaga, R. (2016). Creep
#' analysis of silicone for podiatry applications. Journal of the Mechanical
#' Behavior of Biomedical Materials, 63, 456-469. DOI
#' 10.1016/j.jmbbm.2016.07.014.
#' 
#' Naya, S., Meneses A,. Tarrio-Saavedra, J,. Artiaga R., Lopez-Beceiro, J. and
#' Gracia-Fernandez C. (2013) New method for estimating shift factors in
#' time-temperatura superposition models. Journal of Thermal Analysis and
#' Calorimetry. ISSN 1388-6150. DOI 10.1007/s10973-013-3193-1.
#' @keywords datasets
#' @examples
#' 
#' data(Epoxy)
#' 
NULL


#' Dataset obtained from creep tests of styrene-butadiene-styrene (SBS)
#' composite by using Dynamic Mechanical Thermal Analysis (DMTA)
#' 
#' SBS is a dataset composed of 195 rows and 3 columns that describes the
#' performance in the framework of a creep test of a styrene-butadiene-styrene
#' (SBS) composite. The creep tests are defined by the application of a
#' constant stress, \eqn{\sigma}, and the measuring of the strain, \eqn{\varepsilon (t)}, 
#' or compliance, \eqn{J(t)= \varepsilon (t) / \sigma} (in the present case), as 
#' the response variable. The
#' experimental tests are made by Dynamic Mechanical Thermal Analysis (DMTA)
#' technique, using a 3 point bending configuration with the following
#' features: Clamp, 3-Point Bending; Geometry, Rectangular; Size: length of 20
#' mm, width of 5.54 mm, and thickness of about 3.87 mmm.
#' 
#' The dataset corresponds to the measure of the compliance property (with
#' respect to the time) of different specimens of a SBS composite. The
#' measurements were obtained by DMTA experimental technique.
#' 
#' The application of the TTS principle to creep tests is becoming more and
#' more common. Creep test provides information about the deformation of a
#' material subjected to a constant load. This test is in accordance with many
#' real applications such as the performance of shoe insoles, structural
#' materials, asphalt, etc. In this framework, TTS provides the degree of the
#' deformation of the material at an extended range of times, when this
#' material is subjected to a constant load. Therefore, TTS is becoming
#' increasingly useful in studies of material degradation and lifetime
#' estimation. The use of the TTS principle with creep tests usually provides
#' smoother master curves since each curve is usually defined by a larger
#' number of experimental observations than, for example, modulus curves as a
#' function of frequency.
#' 
#' @name SBS
#' @docType data
#' @format This data frame is composed of the following columns: 
#' \describe{
#' \item{Log10_time}{It accounts for 39 different times from 2 s to
#' 3600 s, in logarithmic scale for each one of the 5 studied temperatures
#' (overall 195 observations).} 
#' \item{Log10_Compliance}{It accounts for
#' 39 different values for the compliance, J (MPa-1), for each one of the 5
#' studied temperatures, in base-ten logarithmic scale.}
#' \item{Temperature}{It is the variable that shows the temperature at
#' which the measurements of compliance are experimentally obtained, namely 40,
#' 50, 60, 70, and 80 Celsius degrees.} }
#' @source
#' 
#' Janeiro-Arocas, J., Tarrío-Saavedra, J., López-Beceiro, J., Naya, S.,
#' López-Canosa, A., Heredia-García, N., and Artiaga, R. (2016). Creep
#' analysis of silicone for podiatry applications. Journal of the Mechanical
#' Behavior of Biomedical Materials, 63, 456-469. DOI
#' 10.1016/j.jmbbm.2016.07.014.
#' 
#' Naya, S., Meneses A,. Tarrio-Saavedra, J,. Artiaga R., Lopez-Beceiro, J. and
#' Gracia-Fernandez C. (2013) New method for estimating shift factors in
#' time-temperatura superposition models. Journal of Thermal Analysis and
#' Calorimetry. ISSN 1388-6150. DOI 10.1007/s10973-013-3193-1.
#' @keywords datasets
#' @examples
#' 
#' data(SBS)
#' 
NULL
