;; Studio demo
;; ================
;;
;; Welcome to Studio, a Scheme-based GUI
;; for the libfive CAD kernel.


;; Shapes are defined in this pane, and rendered
;; on the right.  You can start with shapes from
;; the standard library, e.g.


;; Any top-level expression that evaluates to a
;; shape will be rendered as a mesh.  You can
;; control bounds and resolution in the View menu.


;; Constructive solid geometry (CSG)
;; operations can be peformed using the libfive
;; standard library functions e.g. this difference
;; operation:
(difference (box [-4 -1 -1] [-2 1 0]) (box [-3 -1 -0.5] [-2 0.5 0]))


;; To see a full list of shapes in the standard library,
;; open the "Shape reference" from the help menu.

;; Additional examples can be found in the source
;; repository--locally or online:
;;
;;   <https://github.com/libfive/libfive/tree/master/studio/examples>

;; To learn more, dig into the source code;
;; documentation is sparse at the moment, but
;; libfive-guile.cpp should be informative.

(set-quality! 8)
(set-resolution! 10)
(set-bounds! [-10 -10 -10] [10 10 10])