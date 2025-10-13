using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Society_8777.Interface;
using Society_8777.Models;

namespace Society_8777.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class IncidentController : ControllerBase
    {
        readonly private IInc _IInc;
        
        public IncidentController(IInc inc)
        {
                _IInc = inc;
            
        }
        [HttpPost("GetNotification")]
        public async Task<IActionResult> GetNotification(Models.Tbl_Incident tbl_INC)
        {
            try
            {
                var getNoti = await _IInc.GetNotification(tbl_INC);
                return getNoti ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("AddIncident")]
        public async Task<IActionResult> AddIncident(Models.Tbl_Incident tbl_INC)
        {
            string fullpath = string.Empty;
            try
            {
               
                
                var addInc = await _IInc.AddIncident(tbl_INC);
                return addInc ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("UpdateIncident")]
        public async Task<IActionResult> UpdateIncident(Models.Tbl_Incident tbl_INC)
        {
            string FullPath = string.Empty;
            try
            {
                //tbl_INC.INCImage = _IInc.ConvertImageToByteArray(tbl_INC.INCImagePath);
                if (!string.IsNullOrEmpty(tbl_INC.INCImagePath))
                {
                  FullPath =    UploadImage(tbl_INC);

                }
                tbl_INC.INCImagePath = FullPath;
                var updateInc = await _IInc.UpdateIncident(tbl_INC);
               
                return updateInc ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }

        [HttpPost("DeleteIncident")]
        public async Task<IActionResult> DeleteIncident(Models.Tbl_Incident tbl_INC)
        {
            try
            {
                var deleteInc = await _IInc.DeleteIncident(tbl_INC);
                return deleteInc ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("GetAllIncidentList")]
        public async Task<IActionResult> GetAllIncidentList(Models.Tbl_Incident tbl_INC)
        {
            try
            {
                var getAllInc = await _IInc.GetAllIncidentList(tbl_INC);
                return getAllInc ?? NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error=>> {ex.Message}");
            }
        }
        [HttpPost("upload")]
        public string  UploadImage([FromBody] Tbl_Incident request)
        {
            if (string.IsNullOrWhiteSpace(request.INCImagePath))
            {
                return "Failed";// BadRequest("Image path is required.");
            }

            if (!System.IO.File.Exists(request.INCImagePath))
            {
                return "Failed";
            }

            try
            {
                // Read image bytes
                var imageBytes = System.IO.File.ReadAllBytes(request.INCImagePath);

                // Optional: Save the file to wwwroot/uploads folder
                var uploadsFolder = Path.Combine(Environment.CurrentDirectory + "\\Images\\INCImg");
                if (!Directory.Exists(uploadsFolder))
                    Directory.CreateDirectory(uploadsFolder);

                var fileName = Path.GetFileName(request.INCImagePath);
                var destinationPath = Path.Combine(uploadsFolder, fileName);

                System.IO.File.WriteAllBytes(destinationPath, imageBytes);

                return destinationPath;
            }
            catch (Exception ex)
            {
                
            }
            return string.Empty;
        }
        [HttpPost("incimg")]
        public async Task<IActionResult> UploadGuestImage(IFormFile file)
        {
            if (file == null || file.Length == 0)
                return BadRequest("No file uploaded.");

            var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "Images", "INCImg");

            if (!Directory.Exists(uploadsFolder))
                Directory.CreateDirectory(uploadsFolder);

            var filePath = Path.Combine(uploadsFolder, file.FileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return Ok(new { filePath });
        }


        //[HttpGet("{fileName}")]
        //public IActionResult GetImage(string fileName)
        //{
        //    if (string.IsNullOrWhiteSpace(fileName))
        //    {
        //        return BadRequest("Filename is required.");
        //    }


        //    var filePath = fileName ;//Path.Combine(uploadsFolder, fileName);

        //    if (!System.IO.File.Exists(filePath))
        //    {
        //        return NotFound("Image not found.");
        //    }

        //    var imageBytes = System.IO.File.ReadAllBytes(filePath);
        //    var contentType = GetContentType(filePath);

        //    return File(imageBytes, contentType);
        //}

        private string GetContentType(string path)
        {
            var ext = Path.GetExtension(path).ToLowerInvariant();

            return ext switch
            {
                ".jpg" or ".jpeg" => "image/jpeg",
                ".png" => "image/png",
                ".gif" => "image/gif",
                ".bmp" => "image/bmp",
                _ => "application/octet-stream"
            };
        }
    }

    }

