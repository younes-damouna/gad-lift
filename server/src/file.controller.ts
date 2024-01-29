import { Controller, Get, Param, Res } from '@nestjs/common';
import { join } from 'path';
import { existsSync } from 'fs';

@Controller('')
export class FileController {
  @Get('uploads/:filename')
  serveFile(@Param('filename') filename: string, @Res() res) {
    const path = join(__dirname, '..', 'uploads', filename);

    if (existsSync(path)) {
      return res.sendFile(path);
    } else {
      return res.status(404).send('File not found');
    }
  }
  getPath(filename:string){
    const path = join(__dirname, '..', 'uploads', filename);
    console.log(path)
  }
}
