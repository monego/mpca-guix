(define-module (mpca-ann)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages mpi)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (srfi srfi-1))

(define-public scsr-mpca-ann
  ;; There are no tagged releases.
  (let ((commit "6405a44fd1d1e34bf0b542722e218054740a6a4c")
        (revision "0"))
    (package
      (name "scsr-mpca-ann")
      (version "0.0.0") ;no version in upstream
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
               (url "https://github.com/scsr-inpe/mpca-ann")
               (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
          (base32 "0qaj8jinx36mblk8a7f84bqdl982n2zbvi4nncbcjsj0vn47k1ig"))))
      (build-system gnu-build-system)
      (arguments
       `(#:phases
	 (modify-phases %standard-phases
	   (delete 'configure)
	   (delete 'check))))
      (native-inputs
       `(("gfortran-toolchain" ,gfortran-toolchain)))
      (inputs
       `(("openmpi" ,openmpi)))
      (home-page "https://github.com/scsr-inpe/mpca-ann")
      (synopsis "Auto-configuration of Neural Networks using MPCA")
      (description
       "Auto-configuration of Neural Networks using the Multi-particle
Collision Algorithm (MPCA)")
      (license #f))))

(define-public sabrina-mpca-rna
  ;; There are no tagged releases.
  (let ((commit "85e5ee3bd489aad08b3489912931fe14d993b171")
        (revision "0"))
    (package
      (inherit scsr-mpca-ann)
      (version "0.0.0") ;no version in upstream
      (name "sabrina-mpca-rna")
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
               (url "https://github.com/sabrinabms/mpca-rna/")
               (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
          (base32 "1q5masr24xljac1xm8r8qdahdl5apxpywbcwy64czqhqi9ssk0sl")))))))
