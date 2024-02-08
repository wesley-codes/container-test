import * as React from "react";
import { SVGProps } from "react";
const ArrowSVG = (props: SVGProps<SVGSVGElement>) => (
  <svg
    fill="#000000"
    width="15px"
    height="15px"
    viewBox="0 0 24 24"
    xmlns="http://www.w3.org/2000/svg"
    {...props}
  >
    <path d="M3.293,20.707a1,1,0,0,1,0-1.414L17.586,5H12a1,1,0,0,1,0-2h8a1,1,0,0,1,1,1v8a1,1,0,0,1-2,0V6.414L4.707,20.707a1,1,0,0,1-1.414,0Z" />
  </svg>
);
export default ArrowSVG;
